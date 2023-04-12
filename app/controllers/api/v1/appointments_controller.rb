module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :authenticate_user!

      def index
        appointments = current_user.appointments
        if appointments.any?
          render json: appointments
        else
          render json: { error: 'appointments not found' }, status: :not_found
        end
      end

      def create
        appointment = Appointment.new(appointments_params)
        doc_available_time = DoctorAppointmentTime.find(appointment.doctor_appointment_time_id)
        appointment.date = doc_available_time.date
        appointment.time_from = doc_available_time.time_from
        appointment.time_to = doc_available_time.time_to
        appointment.doctor_id = doc_available_time.doctor_id
        appointment.cancelled = false
        appointment.doctor_appointment_time_id = doc_available_time.id
        appointment.user_id = current_user.id
        if doc_available_time.available
          if appointment.save
            doc_available_time.update(available: false) 
            render json: { status: 'Appointment Created' }
          else
            render json: { status: 'error' }
          end
        else
          render json: { status: 'Appointment taken' }
        end
      end

      def destroy
        appointment = Appointment.find(params[:id])
        doc_available_time = DoctorAppointmentTime.find(appointment.doctor_appointment_time_id)
        if appointment.destroy
          doc_available_time.update(available: true)
          render json: { status: 'Appointment cancelled' }
        else
          render json: { status: 'error' }
        end
      end

      private

      def appointments_params
        params.require(:appointment).permit(:description, :doctor_appointment_time_id)
      end
    end
  end
end
