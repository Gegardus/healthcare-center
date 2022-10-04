class PrescriptionsController < ApplicationController
  before_action :authenticate_doctor!, only: %i[create destroy]

  def index
    @prescriptions = Prescription.all
  end

  def show
    @prescription = Prescription.find(params[:id])    
    @appointment = Appointment.find(@prescription.appointment_id)    
  end

  def new
    @prescription = Prescription.new
    @appointments = Appointment.all
    @user = User.find(1)
    # @user = User.extract_associated(params[:user_id])
    # @user = User.joins(:appointments).where(params[:user_id])
    # @user = User.where(appointment_id: user_id)
    
  end

  def create
    @prescription = Prescription.new(prescription_params)

    if @prescription.save
      redirect_to @prescription
      flash[:notice] = 'Your prescription was successfully created'
    else
      render :new, alert: 'An error has occurred while creating a prescription'
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy!
    redirect_to prescriptions_path(id: @doctor.id), notice: 'Prescription was deleted successfully!'
  end

  private

  def prescription_params
    params.require(:prescription).permit(:prescript, :appointment_id)
  end
end
