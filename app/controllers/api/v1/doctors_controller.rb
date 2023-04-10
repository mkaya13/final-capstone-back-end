module Api
  module V1
    class DoctorsController < ApplicationController
      def index
        render json: Doctor.all
      end

      def show
        doctor = Doctor.find(params[:id])
        render json: doctor
      end
    end
  end
end
