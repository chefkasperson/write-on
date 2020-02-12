class Jam < ActiveRecord::Base
  has_many :stories
  has_many :users, through: :stories

  def self.open_jams
    Jam.all.select{|jam| jam.status == 'upcoming'}
  end

  def self.voting_jams
    Jam.all.select{|jam| jam.status == 'voting'}
  end

  def self.closed_jams
    Jam.all.select{|jam| jam.status == 'closed'}
  end
end