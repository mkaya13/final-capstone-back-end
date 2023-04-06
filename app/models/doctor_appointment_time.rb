class DoctorAppointmentTime < ApplicationRecord
  has_many :doctor_times
  belongs_to :doctor
  #belongs_to :appointment
end
