class User < ActiveRecord::Base
  has_many :stories
  has_many :jams, through: :stories

  has_secure_password

  validates :username, length: {
    minimum: 6,
    maximum: 35,
  }, uniqueness: true

  validates :password, format: {
    with: /\A[a-zA-Z0-9!@#\$%^&\(\)]+\z/,
    message: "only allows a-z, 0-9 and !@#$%^&*()"
  }

end