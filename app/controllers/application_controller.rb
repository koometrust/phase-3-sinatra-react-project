class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
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
  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json
  end

  # Update a user
  patch "/users/:id" do
    user = User.find(params[:id])
    user.update(params)
    user.to_json
  end

  # Delete a user
  delete "/users/:id" do
    user = User.find(params[:id])
    user.destroy
    { message: "User deleted successfully" }.to_json
  end


end
