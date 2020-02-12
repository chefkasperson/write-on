class Jam < ActiveRecord::Base
  has_many :stories
  has_many :users, through: :stories

  def open_jams
    Jam.all.select{|jam| jam.status == 'open'}
  end

  def voting_jams
    Jam.all.select{|jam| jam.status == 'voting'}
  end

  def closed_jams
    Jam.all.select{|jam| jam.status == 'closed'}
  end
end