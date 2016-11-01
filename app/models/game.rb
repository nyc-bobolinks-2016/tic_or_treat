class Game < ApplicationRecord
  belongs_to :user

  validates :board, :user_id, :outcome, presence: true
  validates :outcome, numericality: { only_integer: true, greater_than: -2, less_than: 2  }

  def game_status
    self.outcome == -1 ? "Loss" :
    self.outcome == 0 ? "Tie" :
    self.outcome == 1 ? "Win" : "Not Found"
  end

  def game_time
    (self.created_at - self.updated_at) / 1000
  end
end
