class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    "Hello World"
  end

  get '/login' do
    erb :login
  end

  # Retrieve all users
  get "/users" do
    users = User.all
    users.to_json
  end

  # Create a new user
  post "/users" do
    user = User.create(params)
    user.to_json
  end

  # Retrieve a specific user
  get "/users/:id" do |id|
    user = User.find(id)
    user.to_json
  end

  # Update a user
  patch "/users/:id" do |id|
    user = User.find(id)
    user.update(params)
    user.to_json
  end

  # Delete a user
  delete "/users/:id" do |id|
    user = User.find(id)
    user.destroy
    { message: "User deleted successfully" }.to_json
  end

  # Render the registration form
  get '/register' do
    erb :'register.erb'
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

  # ... other routes and methods ...
end
