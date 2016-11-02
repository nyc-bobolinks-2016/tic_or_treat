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

    if self.board.chars[0..2].all? {|letter| letter == mark} ||
      self.board.chars[3..5].all? {|letter| letter == mark} ||
      self.board.chars[6..8].all? {|letter| letter == mark} ||
      self.board.chars[0] == mark && self.board.chars[4] == mark && self.board.chars[8] == mark ||
      self.board.chars[2] == mark && self.board.chars[4] == mark && self.board.chars[6] == mark ||
      self.board.chars[0] == mark && self.board.chars[3] == mark && self.board.chars[6] == mark ||
      self.board.chars[1] == mark && self.board.chars[4] == mark && self.board.chars[7] == mark ||
      self.board.chars[2] == mark && self.board.chars[5] == mark && self.board.chars[8] == mark
      return true
    else
      return false
    end
  end

  def update_board(idx)
    board_change = self.board
    board_change[idx] = 'X'
    board_change
  end

  def computer_guess
    board_change = self.board
    empties = self.board.chars.map.with_index {|space, index| index if space == "-"}.compact
    p board_change[0] == "X"
    p board_change[4] == "X"
    p board_change[8] == "-"
    
    if board_change[0] == 'O' && board_change[4] == 'O' && board_change[8] == "-"
        board_change[8] = "O"
        [8, board_change]
      elsif board_change[4] == 'O' && board_change[8] == 'O' && board_change[0] == "-"
        board_change[0] = "O"
        [0, board_change]
      elsif board_change[0] == 'O' && board_change[8] == 'O' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[2] == 'O' && board_change[4] == 'O' && board_change[6] == "-"
        board_change[6] = "O"
        [6, board_change]
      elsif board_change[6] == 'O' && board_change[4] == 'O' && board_change[2] == "-"
        board_change[2] = "O"
        [2, board_change]
      elsif board_change[6] == 'O' && board_change[2] == 'O' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[0] == 'O' && board_change[1] == 'O' && board_change[2] == "-"
        board_change[2] = "O"
        [2, board_change]
      elsif board_change[0] == 'O' && board_change[2] == 'O' && board_change[1] == "-"
        board_change[1] = "O"
        [1, board_change]
      elsif board_change[1] == 'O' && board_change[2] == 'O' && board_change[0] == "-"
        board_change[0] = "O"
        [0, board_change]
      elsif board_change[3] == 'O' && board_change[4] == 'O' && board_change[5] == "-"
        board_change[5] = "O"
        [5, board_change]
      elsif board_change[4] == 'O' && board_change[5] == 'O' && board_change[3] == "-"
        board_change[3] = "O"
        [3, board_change]
      elsif board_change[5] == 'O' && board_change[3] == 'O' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[6] == 'O' && board_change[7] == 'O' && board_change[8] == "-"
        board_change[8] = "O"
        [8, board_change]
      elsif board_change[7] == 'O' && board_change[8] == 'O' && board_change[6] == "-"
        board_change[6] = "O"
        [6, board_change]
      elsif board_change[8] == 'O' && board_change[6] == 'O' && board_change[7] == "-"
        board_change[7] = "O"
        [7, board_change]
      elsif board_change[0] == 'O' && board_change[3] == 'O' && board_change[6] == "-"
        board_change[6] = "O"
        [6, board_change]
      elsif board_change[3] == 'O' && board_change[6] == 'O' && board_change[0] == "-"
        board_change[0] = "O"
        [0, board_change]
      elsif board_change[6] == 'O' && board_change[0] == 'O' && board_change[3] == "-"
        board_change[3] = "O"
        [3, board_change]
      elsif board_change[1] == 'O' && board_change[4] == 'O' && board_change[7] == "-"
        board_change[7] = "O"
        [7, board_change]
      elsif board_change[4] == 'O' && board_change[7] == 'O' && board_change[1] == "-"
        board_change[1] = "O"
        [1, board_change]
      elsif board_change[7] == 'O' && board_change[1] == 'O' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[2] == 'O' && board_change[5] == 'O' && board_change[8] == "-"
        board_change[8] = "O"
        [8, board_change]
      elsif board_change[5] == 'O' && board_change[8] == 'O' && board_change[2] == "-"
        board_change[2] = "O"
        [2, board_change]
      elsif board_change[8] == 'O' && board_change[2] == 'O' && board_change[5] == "-"
        board_change[5] = "O"
        [5, board_change]
    elsif board_change[0] == 'X' && board_change[4] == 'X' && board_change[8] == "-"
        board_change[8] = "O"
        [8, board_change]
      elsif board_change[4] == 'X' && board_change[8] == 'X' && board_change[0] == "-"
        board_change[0] = "O"
        [0, board_change]
      elsif board_change[0] == 'X' && board_change[8] == 'X' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[2] == 'X' && board_change[4] == 'X' && board_change[6] == "-"
        board_change[6] = "O"
        [6, board_change]
      elsif board_change[6] == 'X' && board_change[4] == 'X' && board_change[2] == "-"
        board_change[2] = "O"
        [2, board_change]
      elsif board_change[6] == 'X' && board_change[2] == 'X' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[0] == 'X' && board_change[1] == 'X' && board_change[2] == "-"
        board_change[2] = "O"
        [2, board_change]
      elsif board_change[0] == 'X' && board_change[2] == 'X' && board_change[1] == "-"
        board_change[1] = "O"
        [1, board_change]
      elsif board_change[1] == 'X' && board_change[2] == 'X' && board_change[0] == "-"
        board_change[0] = "O"
        [0, board_change]
      elsif board_change[3] == 'X' && board_change[4] == 'X' && board_change[5] == "-"
        board_change[5] = "O"
        [5, board_change]
      elsif board_change[4] == 'X' && board_change[5] == 'X' && board_change[3] == "-"
        board_change[3] = "O"
        [3, board_change]
      elsif board_change[5] == 'X' && board_change[3] == 'X' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[6] == 'X' && board_change[7] == 'X' && board_change[8] == "-"
        board_change[8] = "O"
        [8, board_change]
      elsif board_change[7] == 'X' && board_change[8] == 'X' && board_change[6] == "-"
        board_change[6] = "O"
        [6, board_change]
      elsif board_change[8] == 'X' && board_change[6] == 'X' && board_change[7] == "-"
        board_change[7] = "O"
        [7, board_change]
      elsif board_change[0] == 'X' && board_change[3] == 'X' && board_change[6] == "-"
        board_change[6] = "O"
        [6, board_change]
      elsif board_change[3] == 'X' && board_change[6] == 'X' && board_change[0] == "-"
        board_change[0] = "O"
        [0, board_change]
      elsif board_change[6] == 'X' && board_change[0] == 'X' && board_change[3] == "-"
        board_change[3] = "O"
        [3, board_change]
      elsif board_change[1] == 'X' && board_change[4] == 'X' && board_change[7] == "-"
        board_change[7] = "O"
        [7, board_change]
      elsif board_change[4] == 'X' && board_change[7] == 'X' && board_change[1] == "-"
        board_change[1] = "O"
        [1, board_change]
      elsif board_change[7] == 'X' && board_change[1] == 'X' && board_change[4] == "-"
        board_change[4] = "O"
        [4, board_change]
      elsif board_change[2] == 'X' && board_change[5] == 'X' && board_change[8] == "-"
        board_change[8] = "O"
        [8, board_change]
      elsif board_change[5] == 'X' && board_change[8] == 'X' && board_change[2] == "-"
        board_change[2] = "O"
        [2, board_change]
      elsif board_change[8] == 'X' && board_change[2] == 'X' && board_change[5] == "-"
        board_change[5] = "O"
        [5, board_change]
      else
          idx = empties.shuffle.first
          self.board[idx] = "O"
          [idx, board_change]
      end
  end


end
