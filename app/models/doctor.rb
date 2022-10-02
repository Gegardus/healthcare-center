class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :category
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :phone, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
