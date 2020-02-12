class Jam < ActiveRecord::Base
  has_many :stories
  has_many :users, through: :stories

  validates :name, presence: true
  validates :theme, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.open_jams
    Jam.all.select{|jam| jam.status == 'upcoming'}
  end

  def self.voting_jams
    Jam.all.select{|jam| jam.status == 'voting'}
  end

  def self.closed_jams
    Jam.all.select{|jam| jam.status == 'closed'}
  end

  def published_stories
    self.stories.select{|story| story.published? == true}
  end
    
end