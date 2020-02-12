class JamsController < ApplicationController

  get '/jams' do
    @jams = Jam.all
    erb :'/jams/index'
  end

  get '/jams/new' do
    if logged_in? && current_user.permission == "admin"
      erb :'/jams/new'
    else
      redirect to '/jams'
    end
  end

  post '/jams' do
    if logged_in? && current_user.permission == 'admin'
      if 
    else
      redirect to '/jams'
    end
end

