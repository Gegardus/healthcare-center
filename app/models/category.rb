class Category < ApplicationRecord
  belongs_to :doctor

  validates :name, presence: true, uniqueness: true
  validates :doctor_id, presence: true
end
