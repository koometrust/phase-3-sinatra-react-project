class Workout < ActiveRecord::Base
    belongs_to :user
    has_many :exercises, dependent: :destroy
    
    validates :date, presence: true
    validates :duration_in_minutes, numericality: { greater_than: 0 }
    
    validate :validate_exercises_presence
    
    private
    
    def validate_exercises_presence
      errors.add(:base, "Workout must have at least one exercise") if exercises.empty?
    end
  end
  