class UsersController < ApplicationController
  
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

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    if @user == current_user
      erb :'users/edit'
    else
      redirect to '/'
    end
  end

  post '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    binding.pry
    if @user.update(params[:user])
      redirect to "/users/#{@user.slug}"
    else
      erb :'/users/edit'
    end
  end

  delete '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if @user
      @user.destroy
    else
      redirect to '/users'
    end
  end

end