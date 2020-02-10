class UsersController < ApplicationController
  get 'users' do
    erb :'/users/index'
  end

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      @user.save
      session[:user_id] = @user.id
      redirect to '/stories'
    else
      @errors = author.errors.full_messages
      erb :'users/new'
    end
  end
end