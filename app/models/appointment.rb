class Appointment < ApplicationRecord
  has_many :doctor
  has_many :users

  validates :description, presence: true
  validates :time, presence: true
  validates :date, presence: true
end
