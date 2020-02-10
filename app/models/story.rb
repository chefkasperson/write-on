class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam

  def slug
    title.downcase.gsub(' ', '-')
  end

  def find_by_slug(slug)
    Story.all.find{|story| story.slug == slug}
  end
end
