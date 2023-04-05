class AppointmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :set_user, only: %i[index create destroy]
  before_action :set_appointment, only: %i[destroy]

  def index
    @appointments = @user.appointments
    if @appointments.any?
      render json: @appointments
    else
      render json: { error: 'appointments not found' }, status: :not_found
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = @user
    @appointment.doctor = Doctor.find(params[:doctor_id])
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @appointment.destroy
      render json: { message: 'Appointment deleted' }, status: :ok
    else
      render json: { error: 'Appointment deletion failed' }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_appointment
    @appointment = @user.appointments.find_by(id: params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:description, :date, :time)
  end

  def not_found
    render json: { error: 'Appointment not found' }, status: :not_found
  end
end
