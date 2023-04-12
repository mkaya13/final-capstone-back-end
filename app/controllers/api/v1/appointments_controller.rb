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
        if doc_available_time.available
          if doc_available_time.update(available: false) && appointment.save
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
        if doc_available_time.update(available: true) && appointment.destroy
          render json: { status: 'Appointment cancelled' }
        else
          render json: { status: 'error' }
        end
      end

      private

      def appointments_params
        params.require(:appointment).permit(:description, :date, :time_from, :time_to, :cancelled,
                                            :doctor_appointment_time_id, :doctor_id, :user_id)
      end
    end
  end
end
