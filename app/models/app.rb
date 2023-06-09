require 'sinatra'
require 'sinatra/activerecord'
require_relative 'application_controller'


# Require your model files
require_relative '../models/user'
require_relative '../models/exercise'
require_relative '../models/workout'

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

# Create a new workout
get '/workouts/new' do
  erb :workout_form, locals: { workout: nil, errors: nil }
end

post '/workouts' do
  workout = Workout.new(name: params[:name], description: params[:description])

  if workout.save
    redirect '/workouts'
  else
    erb :workout_form, locals: { workout: workout, errors: workout.errors.full_messages }
  end
end

# Edit an existing workout
get '/workouts/:id/edit' do |id|
  workout = Workout.find_by(id: id)

  if workout
    erb :workout_form, locals: { workout: workout, errors: nil }
  else
    redirect '/workouts'
  end
end

put '/workouts/:id' do |id|
  workout = Workout.find_by(id: id)

  if workout
    workout.name = params[:name]
    workout.description = params[:description]

    if workout.save
      redirect '/workouts'
    else
      erb :workout_form, locals: { workout: workout, errors: workout.errors.full_messages }
    end
  else
    redirect '/workouts'
  end
end

# Delete a workout
delete '/workouts/:id' do |id|
  workout = Workout.find_by(id: id)

  if workout
    workout.destroy
  end

  redirect '/workouts'
end

# View all workouts
get '/workouts' do
  @workouts = Workout.all
  erb :workouts
end

# View exercise logs for a specific workout
get '/workouts/:id' do |id|
  workout = Workout.find_by(id: id)

  if workout
    @exercises = workout.exercises
    erb :exercise_logs, locals: { workout: workout }
  else
    redirect '/workouts'
  end
end
