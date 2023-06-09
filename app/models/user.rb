class User < ActiveRecord::Base
  has_many :workouts
  has_secure_password
  
  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }
end
