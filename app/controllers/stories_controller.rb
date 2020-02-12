class StoriesController < ApplicationController

  get '/stories' do
    if logged_in?
      @stories = Story.all
      erb :'stories/stories'
    else
      redirect to '/login'
    end
  end

  get '/stories/new' do
    if logged_in?
      erb :'stories/create_story'
    else
      redirect to '/login'
    end
  end

  post '/stories' do
    if logged_in?
      if params[:content] == ""
        redirect to "/stories/new"
      else
        @story = current_user.build(content: params[:content])
        if @story.save
          redirect to "/stories/#{@story.id}"
        else
          redirect to '/stories/new'
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/stories/:id' do
    if logged_in?
      @story = Story.find_by(id: params[:id])
      erb :'/stories/show'
    else
      redirect to 'log in'
    end
  end

  get '/stories/:id/edit' do
    if logged_in?
      @story = Story.find_by(id: params[:id])
      if @story && @story.user == current_user
        erb :'/stories/edit'
      else
        redirect to '/stories'
      end
    else
      redirect to '/login'
    end
  end
      

end
