class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/new'
  end

  post '/login' do
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.slug}"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
