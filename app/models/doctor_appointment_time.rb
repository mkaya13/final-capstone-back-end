class DoctorAppointmentTime < ApplicationRecord
  has_many :doctor_times, dependent: :destroy
  belongs_to :doctor

  validates :doctor_time_id, presence: true
  validates :doctor_id, presence: true
  validates :date, presence: true
  validates :doctor_time_id, presence: true
end
