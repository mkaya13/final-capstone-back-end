module Api
  module V1
    class DoctorsController < ApplicationController
      # Add sample function to return a random single sample.
      def index
        render json: Doctor.all
      end
    end
  end
end
