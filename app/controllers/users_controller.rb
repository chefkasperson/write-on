class UsersController < ApplicationController
  get 'users' do
    erb :'/users/index'
  end

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    binding.pry
  end
end