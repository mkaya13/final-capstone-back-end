class Doctor < ApplicationRecord
  has_many :doctor_times
  has_many :appointments
  has_many :time_schedules
  has_many :doctor_appointment_times

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :fees, presence: true
  validates :major, presence: true
  validates :profile_picture, presence: true
end
