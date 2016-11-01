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
    (self.created_at - self.updated_at) / 1000

  def update_board(idx)
    a = self.board
    a[idx] = 'X'
    a
  end
end
