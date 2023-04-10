module Api
  module V1
    class AppointmentsController < ApplicationController
      def create
        appointment = Appointment.new(appointments_params)
        if appointment.save
          doc_available_time = DoctorAppointmentTime.find(appointment.doctor_appointment_time_id)
          doc_available_time.available = false
          render json: { status: 'success' }
        else
          render json: { status: 'error' }
        end
      end

      private

      def appointments_params
        params.require(:appointment).permit(:description, :date, :time_from, :time_to, :cancelled,
                                            :doctor_appointment_time_id, :doctor_id).merge(user: current_user)
      end
    end
  end
end
