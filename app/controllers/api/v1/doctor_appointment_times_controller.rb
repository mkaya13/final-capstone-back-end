module Api
  module V1
    class DoctorAppointmentTimesController < ApplicationController
      def index
        appointment_times = DoctorAppointmentTime.where(doctor_id: params[:doctor_id])
        render json: appointment_times
      end
    end
  end
end
