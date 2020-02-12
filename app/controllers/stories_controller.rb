class StoriesController < ApplicationController

  get '/stories' do
    @stories = Story.all
    @published_stories = Story.published_stories
    erb :'stories/index'
  end

  get '/stories/new' do
    if logged_in?
      erb :'stories/new'
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
    @story = Story.find_by(id: params[:id])
    erb :'/stories/show'
  end

  get '/stories/:id/edit' do
    if logged_in?
      @story = Story.find_by(id: params[:id])
      if @story && @story.published? == false && (@story.user == current_user || current_user.permission == 'admin')
        erb :'/stories/edit'
      else
        redirect to '/stories'
      end
    else
      redirect to '/login'
    end
  end

  patch '/stories/:id' do
    if logged_in?
      if params[:content] == ""
        redirect to "/stories/#{params[:id]}/edit"
      else
        @story = Story.find_by(id: params[:id])
        if @story && (@story.user == current_user || current_user.permission == 'admin')
          if @story.update(content: params[:content])
            redirect to "/stories/#{@story.id}"
          else
            redirect to "/stories/#{@story.id}/edit"
          end
        else
          redirect to '/stories'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/stories/:id/delete' do
    if logged_in?
      @story = Story.find_by(id: params[:id])
      if @story && (@story.user == current_user || current_user.permission == 'admin')
        @story.delete
      end
      redirect to '/stories'
    else
      redirect to '/login'
    end
  end 

end
