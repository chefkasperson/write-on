class User < ActiveRecord::Base
  has_many :stories
  has_many :jams, through: :stories

  has_secure_password

  validates :username, length: {
    minimum: 6,
    maximum: 35
  }, uniqueness: true
  
  validates :email, length: {
    minimum: 6,
    maximum: 35
  }, uniqueness: true

  validates :password, format: {
    with: /\A[a-zA-Z0-9!@#\$%^&\(\)]+\z/,
    message: "only allows a-z, 0-9 and !@#$%^&*()"
  }

  def slug
    username.downcase.gsub(' ', '-')
  end
  
  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end
end