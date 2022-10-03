class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  has_one :prescription

  validate :max_open_appointments 

  private

  def max_open_appointments
    if Appointment.where(closed: false).count > 10      
    end
  end 
end
