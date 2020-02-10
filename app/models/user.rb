class User < ActiveRecord::Base
  has_many :stories
  has_many :jams, through: :stories

  has_secure_password

end