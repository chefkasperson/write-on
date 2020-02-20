require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "thats_my_jam"
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      redirect to '/login' if !logged_in?
    end

    def authorized_to_enter
      redirect to '/stories' if !@story || (@story.user != current_user && current_user.permission != 'admin')
    end
  end
end





















