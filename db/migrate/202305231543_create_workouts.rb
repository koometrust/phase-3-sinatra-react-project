# 20230523120200_create_workouts.rb
class CreateWorkouts < ActiveRecord::Migration[6.0]
    def change
      create_table :workouts do |t|
        t.references :user
        t.date :date
        t.integer :duration_in_minutes
  
        t.timestamps null: false
      end
    end
  end
  