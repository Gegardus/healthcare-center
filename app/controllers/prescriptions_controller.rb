class PrescriptionsController < ApplicationController
  before_action :authenticate_doctor!, only: %i[create destroy]

  def index
    @doctor = current_doctor
    @prescription = @appointment.prescriptions
  end

  def show
    @doctor = current_doctor
    @prescription = Prescription.find(params[:id])
  end

  def new
    @prescription = Prescription.new
  end

  def create
    # @appointment = Appointment.find(params[:appointment_id])
    @prescription = Prescription.new(prescription_params)
    @prescription = @appointment.prescriptions

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
