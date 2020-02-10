class User < ActiveRecord::BasicObject
  has_many :stories
  has_many :jams, through: :stories

  has_secure_password

end