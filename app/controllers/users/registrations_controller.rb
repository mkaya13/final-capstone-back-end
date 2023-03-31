# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      user = User.create(user_params)
      if user.valid? && user.save
        # user.send_confirmation_instructions unless user.confirmed?
        render json: user, status: :created
        return
      end
      render json: user.errors, status: unprocessable_entity
    end

    private

    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :email, :password, :password_confirmation
      )
    end
  end
end
