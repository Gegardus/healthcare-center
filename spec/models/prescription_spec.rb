require 'rails_helper'

RSpec.describe Prescription, type: :model do
  subject do
    create(:category)
    @doctor = Doctor.create(full_name: 'Vahan', phone: '8889995678', category: @category, image: 'doc1.png', email: 'doc@mail.com',
               password: 'docdoc', category_id: '1')  
    create(:user)           
    @appointment = Appointment.create(appointment_date: Time.now, doctor: @doctor, user: @user, doctor_id: 1, user_id: 1)  
    Prescription.new(prescript: 'Lorem Ipsum', appointment: @appointment, appointment_id: '1')    
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end

