require 'sinatra'
require 'sinatra/activerecord'
require_relative 'controllers/application_controller'
require_relative 'models/user'
require_relative 'models/exercise'
require_relative 'models/workout'

# Set up the application
class WorkoutApp < Sinatra::Base
  use ApplicationController

  get '/' do
    "Hello World"
  end

  # Render the login form
  get '/login' do
    erb :login, locals: { error_message: nil }
  end

  # Handle login form submission
  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/dashboard' # Redirect to the user's dashboard
    else
      # Handle invalid login credentials
      erb :login, locals: { error_message: 'Invalid email or password' }
    end
  end

  # Render the registration form
  get '/register' do
    erb :register
  end

  # Handle registration form submission
  post '/register' do
    user = User.new(
      full_name: params[:full_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      redirect '/dashboard' # Redirect to the user's dashboard
    else
      # Handle validation errors
      erb :register, locals: { errors: user.errors.full_messages }
    end
  end

  # Handle logout
  get '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  # Helper method to check if the user is logged in
  def logged_in?
    !session[:user_id].nil?
  end

  # Protect routes that require authentication
  before '/dashboard' do
    redirect '/login' unless logged_in?
  end

  # Render the dashboard
get '/dashboard' do
  # Ensure that the user is logged in
  redirect '/login' unless logged_in?

  # Fetch the user's data from the database
  user = User.find(session[:user_id])

  # Pass the user's data to the dashboard view
  erb :dashboard, locals: { user: user }
end

end
