class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @user = current_user # User.find(params[:user_id])
    # @doctor = Doctor.find(params[:doctor_id])
    @appointments = Appointment.all
  end

  def show
    @user = current_user
    @appointment = Appointment.find(params[:id])
  end

  def new
    doctor = Doctor.find_by(id: params[:doctor_id])
    @appointment = current_user.appointments.new(doctor:)
  end

  def create
    doctor = Doctor.find_by(id: params[:doctor_id])
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
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
