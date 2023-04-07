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
    # @doctor.user = current_user

    @doctor.save

    # respond_to do |format|
    #   if @doctor.save
    #     format.html { redirect_to doctors_url, notice: 'Doctor was successfully created.' }
    #   else
    #     flash[:error] = 'Error: doctor could not be saved'
    #   end
    # end
  end

  def doctor_params
    params.permit(:first_name, :last_name, :major, :profile_picture, :fees)
  end

end
