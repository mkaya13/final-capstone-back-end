module Api
  module V1
    class DoctorsController < ApplicationController
      def index
        render json: Doctor.all
      end

      def show
        doctor = Doctor.find(params[:id])
        render json: {
          doctor:,
          doctor_appointment_times: doctor.doctor_appointment_times
        }
      end
    end
  end
end
