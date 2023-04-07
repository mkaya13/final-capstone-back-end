module Api
    module V1
      class DoctorAppointmentTimesController < ApplicationController
        def index
          render json: DoctorAppointmentTime.all
        end
      end
    end
  end
  