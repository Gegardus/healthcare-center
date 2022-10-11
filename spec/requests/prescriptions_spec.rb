require 'rails_helper'

RSpec.describe 'Create Prescription', type: :feature do
  before(:each) do
    create(:category)
    @doctor = Doctor.create(full_name: 'Vahan', phone: '8889995678', category: @category,
                            image: 'doc1.png', email: 'doc@mail.com', password: 'docdoc', category_id: '1')
    create(:user)
    @appointment = Appointment.create(appointment_date: Time.now, doctor: @doctor, user: @user, doctor_id: 1,
                                      user_id: 1)
    Prescription.new(prescript: 'Lorem Ipsum', appointment: @appointment, appointment_id: 1)

    visit new_doctor_session_path
    fill_in 'Phone', with: @doctor.phone
    fill_in 'Password', with: @doctor.password
    click_button 'Log in'
    visit doctor_path(@doctor.id)
    click_link('Click here to write prescription')
  end

  describe 'prescriptions#new' do
    it 'adds data to the form and sucessufully submits' do
      visit new_prescription_path
      fill_in 'Prescript', with: 'Ipsum Ipsum Ipsum'
      click_on 'Submit'
      expect(page).to have_content Time.now
    end
  end
end
