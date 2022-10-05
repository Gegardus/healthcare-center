class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: 'Doctor', foreign_key: 'doctor_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_one :prescription, foreign_key: 'appintment_id'  
end
