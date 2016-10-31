class User < ApplicationRecord
  has_many :games
  has_secure_password

  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 12}
end
