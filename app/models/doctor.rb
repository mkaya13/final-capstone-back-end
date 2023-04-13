class Doctor < ApplicationRecord
  has_many :time_schedules, dependent: :destroy, foreign_key: 'doctor_id'
  has_many :doctor_times, dependent: :destroy, foreign_key: 'doctor_id'
  has_many :appointments, dependent: :destroy, foreign_key: 'doctor_id'
  has_many :doctor_appointment_times, dependent: :destroy, foreign_key: 'doctor_id'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :fees, presence: true
  validates :major, presence: true
  validates :profile_picture, presence: true
end
