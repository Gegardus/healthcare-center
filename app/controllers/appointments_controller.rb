class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]  

  def index
    @user = User.find(params[:user_id])
    @doctor = Doctor.find(params[:doctor_id])
    # @appointments = @patient.appointments
  end

  def show
    # @user = User.find(params[:user_id])
    # @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user

    if @appointment.save
      redirect_to @appointment # patient_path(id: @appointment.patient_id)
      flash[:notice] = 'Your appointment was successfully created'
    else
      render :new, alert: 'An error has occurred while creating an appointment'
    end
  end

  def destroy
    @appointment = Appoinment.find(params[:id])  
    @appointment.destroy!
    redirect_to appointments_path(id: @patient.id), notice: 'Appointment was deleted successfully!'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :closed, :doctor_id, :user_id)
  end
end
