require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:user) { create(:user) }
  let(:doctor) do
    Doctor.create(
        first_name:"John",
        last_name:"Smith",
        major: "Cardiology",
        profile_picture: "https://www.kindpng.com/picc/m/490-4909569_png-images-of-doctors-group-png-download-free.png",
        fees: "200.00",
        available_time: "Mon - Fri, 9am - 5pm"
    )
  end
  it 'is not valid without a first_name' do
    doctor.first_name = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without a last_name' do
    doctor.last_name = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without a major' do
    doctor.major = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without a profile_picture' do
    doctor.profile_picture = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without a fees' do
    doctor.fees = nil
    expect(doctor).to_not be_valid
  end



end