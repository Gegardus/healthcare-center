require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        create(:category)
        @doctor = Doctor.create(full_name: 'Vahan', phone: '8889995678', category: @category,
                                image: 'doc1.png', email: 'doc@mail.com', password: 'docdoc', category_id: '1')
        create(:user)
        Appointment.new(appointment_date: Time.now, doctor: @doctor, user: @user, doctor_id: 1, user_id: 1)
      end

      it 'creates a new Appointment' do
        expect do
          post appointments_url, params: { appointment: valid_attributes }
        end.to change(Appointment, :count).by(1)
      end

      it 'redirects to the created article' do
        post appointments_url, params: { appointment: valid_attributes }
        expect(response).to redirect_to(appointment_url(Appointment.last))
      end
    end
  end
end
