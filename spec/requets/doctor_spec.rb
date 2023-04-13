require 'rails_helper'

RSpec.describe 'DoctorsController', type: :request do
  let :user do
    User.find_or_create_by(email: 'mert@hotmail.com') do |user|
      user.password = Devise.friendly_token.first(8)
    end
  end

  describe 'GET api/v1/doctors' do
    # Get lists of all groups
    it 'returns a 200 status response' do
      get doctors_path(user_id: 1)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
