class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :doctor
    has_one :doctor_available_time
end