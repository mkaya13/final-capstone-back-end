module Api
  module V1
    class DoctorAppointmentTimesController < ApplicationController
      def index
        appointment_times = DoctorAppointmentTime.where(doctor_id: params[:doctor_id])
        render json: appointment_times
      end

      def update(doctor_appointment_time_id)
        doc_available_time = DoctorAppointmentTime.find(doctor_appointment_time_id)
        doc_available_time.available = false
        doc_available_time.save
      end
    end
  end
end
