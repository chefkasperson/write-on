class UsersController < ApplicationController
  
  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/stories'
    else
      erb :'users/new'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    if @user == current_user || @user.permission == 'admin'
      erb :'users/edit'
    else
      redirect to '/'
    end
  end

  patch '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if @user
      @user.update(params[:user])
      current_user
      redirect to "/users/#{@user.slug}"
    else
      erb :'/users/edit'
    end
  end

  delete '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if @user
      @user.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end

end