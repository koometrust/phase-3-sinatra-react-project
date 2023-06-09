# 20230523120000_create_exercises.rb
class CreateExercises < ActiveRecord::Migration[6.0]
    def change
      create_table :exercises do |t|
        t.string :name
        t.integer :duration_in_minutes
        t.integer :calories_burned
        t.string :intensity
        t.references :workout
  
        t.timestamps null: false
      end
    end
  end
  