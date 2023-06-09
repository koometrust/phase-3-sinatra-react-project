puts "🌱 Seeding spices..."

# Seed your database here
# db/seeds.rb

# Create sample users
User.create(full_name: "John Doe", age: 25, gender: "Male", email: "john@example.com", password: "password", password_confirmation: "password")
User.create(full_name: "Jane Smith", age: 30, gender: "Female", email: "jane@example.com", password: "password", password_confirmation: "password")
# Create more sample users as needed

puts "✅ Done seeding!"
