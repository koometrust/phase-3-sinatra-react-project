# Workout App
The Workout App is a web application that allows users to track their workouts and exercises.

# Overview
This project is the culmination of Phase 3, where you will be building a full-stack web application using Sinatra as the backend API and React as the frontend. The backend API will utilize Active Record to interact with the database, while the React frontend will consume the API to perform CRUD (Create, Read, Update, Delete) operations on workouts and exercises.

# Features
User Registration: Users can create an account to access the workout tracking features.
Create Workouts: Users can create new workout sessions, specifying the date and duration of the workout.
Add Exercises: Within each workout, users can add exercises, providing details such as exercise name, duration, calories burned, and intensity level.
Track Progress: Users can view their workout history and track their progress over time.
Update and Delete: Users can update or delete existing workouts and exercises.
User Authentication: User passwords will be securely hashed and authenticated using bcrypt.

# Backend Setup
Fork and clone the repository to your local machine.
Navigate to the project directory and run bundle install to install the required gems.
Run rake db:migrate to create the necessary database tables.
Start the Sinatra backend server using bundle exec rake server. The server will run on http://localhost:9292.

# Frontend Setup
Create a new repository for the React frontend in a separate folder.
Use create-react-app to generate the necessary code for your frontend: npx create-react-app my-app-frontend.
Set up your React components, routes, and API calls to interact with the Sinatra backend API.

# API Endpoints
The following API endpoints are available for interacting with the backend:

GET /workouts: Retrieve a list of all workouts.
POST /workouts: Create a new workout.
GET /workouts/:id: Retrieve a specific workout by its ID.
PATCH /workouts/:id: Update a specific workout.
DELETE /workouts/:id: Delete a specific workout.
GET /workouts/:id/exercises: Retrieve a list of exercises for a specific workout.
POST /workouts/:id/exercises: Add a new exercise to a specific workout.
PATCH /exercises/:id: Update a specific exercise.
DELETE /exercises/:id: Delete a specific exercise.

# Dependencies
The project utilizes the following technologies and libraries:

Ruby (2.7.4)
Sinatra (2.1.0)
ActiveRecord (6.1.4)
bcrypt (3.1.16)
PostgreSQL (Database)
React (Frontend library)
Axios (HTTP client for API calls)

# Getting Started
To get started with the project, follow these steps:

Set up the backend by running the necessary migrations and starting the Sinatra server.
Set up the frontend by creating a new React app and configuring the components and API calls.
Start the React development server and ensure it is able to communicate with the backend API.
Implement the desired features and UI enhancements to complete the project.

# Conclusion
The Workout App provides a comprehensive solution for users to track their workouts and exercises. It offers flexibility in managing workout sessions, adding exercises, and monitoring progress. By combining a robust backend API with a user-friendly React frontend, the app delivers a seamless user experience.

Feel free to customize the app further and add additional features based on your project requirements and preferences. Good luck with your project!




