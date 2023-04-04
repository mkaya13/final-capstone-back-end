class DoctorAvailableTime < ApplicationRecord
  belongs_to :appointments

  attribute :available, :boolean, default: true
  validates :date, presence: true
  validates :time, presence: true
end
