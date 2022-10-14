require 'rails_helper'

RSpec.describe 'Create Prescription', type: :feature do
  before(:each) do
    Doctor.destroy_all
    User.destroy_all
    Category.destroy_all
    Appointment.destroy_all
    @category = create(:category)
    @user = create(:user)
    @doctor = create(:doctor)
    @appointment = create(:appointment)
    visit new_doctor_session_path
    fill_in 'Phone', with: @doctor.phone
    fill_in 'Password', with: @doctor.password
    click_button 'Log in'
    visit doctor_path(@doctor.id)
    expect(page).to have_content 'Signout'
  end

  describe 'prescriptions#new' do
    it 'adds data to the form and sucessufully submits' do
      visit new_prescription_path(appointment_id: @appointment.id)
      fill_in 'Prescript', with: 'Ipsum Ipsum Ipsum'
      click_on 'Submit'
      expect(page).to have_content 'All Prescriptions'
    end
  end
end
