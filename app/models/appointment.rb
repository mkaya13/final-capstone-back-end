class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :doctor
    belongs_to :doctor_appointment_time
end

