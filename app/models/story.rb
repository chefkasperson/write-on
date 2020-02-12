class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam

  validates :title, presence: true
  validates :content, presence: true
  validates :jam_id, presence: true

  def self.published_stories
    Story.all.select{|story| story.published? == true}
  end

  def self.unpublished_stories
    Story.all.select{|story| story.published? == false}
  end

end
