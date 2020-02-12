class User < ActiveRecord::Base
  has_many :stories
  has_many :jams, through: :stories

  has_secure_password

  validates :username, length: {
    minimum: 3,
    maximum: 35
  }, uniqueness: true, presence: true
  
  validates :email, length: {
    minimum: 6,
    maximum: 35
  }, uniqueness: true, presence: true

  validates :password, format: {
    with: /\A[a-zA-Z0-9!@#\$%^&\(\)]+\z/,
    message: "only allows a-z, 0-9 and !@#$%^&*()"
  }, presence: true

  def published_stories
    self.stories.select{|story| story.published? == true}
  end
  
  def unpublished_stories
    self.stories.select{|story| story.published? == false}
  end
  
  def open_jams
    self.jams.select{|jam| jam.status == "upcoming"}
  end

  def closed_jams
    self.jams.select{|jam| jam.status == "closed"}
  end

  def slug
    username.downcase.gsub(' ', '-')
  end
  
  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end
end