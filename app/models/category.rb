class Category < ApplicationRecord
  belongs_to :doctor

  validates :name, uniqueness: true
end
