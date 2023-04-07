class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.save
  end

  def doctor_params
    params.permit(:first_name, :last_name, :major, :profile_picture, :fees)
  end

end
