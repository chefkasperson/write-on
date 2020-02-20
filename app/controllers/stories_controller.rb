class StoriesController < ApplicationController

  get '/stories' do
    @closed_jams = Jam.closed_jams
    @stories = Story.all
    @published_stories = Story.published_stories
    erb :'stories/index'
  end

  get '/stories/new' do
    redirect_if_not_logged_in
    @open_jams = Jam.open_jams
    erb :'stories/new'
  end
  
  post '/stories' do
    if logged_in?
      if params[:content] == ""
        redirect to "/stories/new"
      else
        @story = current_user.stories.build(params[:story])
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
    @open_jams = Jam.open_jams
    redirect_if_not_logged_in
    @story = Story.find_by(id: params[:id])
    authorized_to_enter
    erb :'stories/edit'
  #   if @story && (@story.user == current_user || current_user.permission == 'admin')
  #     erb :'/stories/edit'
  #   else
  #     redirect to '/stories'
  #   end
  end

  patch '/stories/:id' do
    redirect_if_not_logged_in
    if params[:content] == ""
      redirect to "/stories/#{params[:id]}/edit"
    else
      @story = Story.find_by(id: params[:id])
      authorized_to_enter
      if @story.update(params[:story])
        redirect to "/stories/#{@story.id}"
      else
        redirect to "/stories/#{@story.id}/edit"
      end
    end
  end

  delete '/stories/:id' do
    redirect_if_not_logged_in
    @story = Story.find_by(id: params[:id])
    authorized_to_enter  
    @story.delete
    redirect to '/stories'
  end 

end
