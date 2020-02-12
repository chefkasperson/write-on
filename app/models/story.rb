class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam

  def published_stories
    Story.all.select{|story| story.published? == true}
  end

end
