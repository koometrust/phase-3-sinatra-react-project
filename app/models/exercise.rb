class Exercise < ActiveRecord::Base
    belongs_to :workout
    
    validates :name, presence: true
    validates :duration_in_minutes, numericality: { greater_than: 0 }
    validates :calories_burned, numericality: { greater_than_or_equal_to: 0 }
    validates :intensity, inclusion: { in: %w(low medium high) }
  end
  