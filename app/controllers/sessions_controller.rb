class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/new'
  end

  post 'login' do
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      redirect to '/login'
    end
  end

  post '/logout' do
    session.clear
    redirect to '/'
  end
end
