class Game < ApplicationRecord
  belongs_to :user

  validates :board, :user_id, :outcome, presence: true
  validates :outcome, numericality: { only_integer: true, greater_than: -2, less_than: 3  }

  def game_status
    self.outcome == -1 ? "Loss" :
    self.outcome == 0 ? "Tie" :
    self.outcome == 1 ? "Win" : "Pending"
  end

  def game_time
    Time.now  - self.updated_at
    # (self.updated_at - self.created_at).round(2)
  end


  def win?(mark)
    pos = [[0,1,2], [3,4,5], [6,7,8]]
    pos = pos + pos.transpose + [[0,4,8], [2,4,6]]
    pos.each do |arr|
      return true if [self.board.chars[arr[0]], self.board.chars[arr[1]], self.board.chars[arr[2]]] == [mark, mark, mark]
    end

    false
  end

  def update_board(idx)
    board_change = self.board
    board_change[idx] = 'X'
    board_change
  end

  def computer_guess
    board_change = self.board
    empties = self.board.chars.map.with_index {|space, index| index if space == "-"}.compact
    pos = [[0,1,2], [3,4,5], [6,7,8]]
    pos = pos + pos.transpose + [[0,4,8], [2,4,6]]
    pos.each do |row|
      if row.select {|i| board_change[i] == 'O'}.length == 2
        row.each do |i|
          if board_change[i] == "-"
            board_change[i] = 'O'
            return [i, board_change]
          end
        end
      elsif row.select {|i| board_change[i] == 'X'}.length == 2
        row.each do |i|
          if board_change[i] == "-"
            board_change[i] = 'O'
            return [i, board_change]
          end
        end
      end
    end
    
    idx = empties.shuffle.first
    self.board[idx] = "O"
    [idx, board_change]
  end


end
