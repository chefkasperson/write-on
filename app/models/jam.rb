class Jam < ActiveRecord::Base
  has_many :stories
  has_many :users, through: :stories
end