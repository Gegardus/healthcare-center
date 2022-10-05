class Prescription < ApplicationRecord
  belongs_to :appointment, class_name: 'Appointment', foreign_key: 'appointment_id'

  validates :prescript, presence: true, length: { in: 1..250 }
end
