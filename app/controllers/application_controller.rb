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

  end
end
























