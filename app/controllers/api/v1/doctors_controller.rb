module Api
  module V1
    class DoctorsController < ApplicationController
      def index
        render json: Doctor.all
      end
    end
  end
end
