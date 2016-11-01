class User < ApplicationRecord
  has_many :games
  has_secure_password

  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 12}

  def games_won
    self.games.select {|game| game.outcome == 1 }
  end

  def games_tied
    self.games.select {|game| game.outcome == 0 }
  end

  def games_lost
    self.games.select {|game| game.outcome == -1 }
  end

  def games_pending
    self.games.select {|game| game.outcome == 2}
  end

  def games_completed
    self.games_won + self.games_tied + self.games_lost
  end
end
