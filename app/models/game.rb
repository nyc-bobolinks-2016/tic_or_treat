class Game < ApplicationRecord
  belongs_to :user
  
  validates :board, :user_id, :outcome, presence: true
  validates :outcome, numericality: { only_integer: true, greater_than: -2, less_than: 2  }
end
