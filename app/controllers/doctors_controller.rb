class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show; end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    if @doctor.destroy
      render json: {deleted_doctor: @doctor, message: 'Doctor deleted' }, status: :ok
    else
      render json: { error: 'Doctor deletion failed' }, status: :unprocessable_entity
    end
  end

  def doctor_params
    params.permit(:first_name, :last_name, :major, :profile_picture, :fees, :available_time)
  end
end
