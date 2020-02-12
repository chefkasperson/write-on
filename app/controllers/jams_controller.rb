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
      if params[:title] == "" || params[:start_date] == "" || params[:end_date] == ""
        redirect to '/jams/new'
      else
        @jam = Jam.new(params)
        if @jam.save
          redirect to '/jams/#{@jam.id}'
        else
          redirect to '/jams/new'
        end
      end
    else
      redirect to '/jams'
    end
  end
end

