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
          redirect to "/jams/#{@jam.id}"
        else
          redirect to '/jams/new'
        end
      end
    else
      redirect to '/jams'
    end
  end

  get '/jams/:id' do
    @jam = Jam.find_by(id: params[:id])
    erb :'/jams/show'
  end

  get '/jams/:id/edit' do
    if logged_in? && current_user.permission == 'admin'
      @jam = Jam.find_by(id: params[:id])
      if @jam
        erb :'/jams/edit'
      else
        redirect to '/jams'
      end
    else
      redirect to '/jams'
    end
  end

  patch '/jams/:id' do
    if logged_in? && current_user.permission == 'admin'
      if params[:title] == "" || params[:start_date] == "" || params[:end_date] == "" || params[:theme] == ""
        redirect to "/jams/#{params[:id]}/edit"
      else
        @jam = Jam.find_by(id: params[:id])
        if @jam
          if @jam.update(
            theme: params[:theme],
            title: params[:title],
            start_date: params[:start_date],
            end_date: params[:end_date]
           )
           redirect to "/jams/#{@jam.id}"
          else
            redirect to "/jams/#{@jam.id}/edit"
          end
        else
          redirect to '/jams'
        end
      end
    else
      redirect to '/jams'
    end
  end

end

