class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :doctor_appointment_time

  validates :description, presence: true
  validates :date, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true
  validates :cancelled, presence: true
end
