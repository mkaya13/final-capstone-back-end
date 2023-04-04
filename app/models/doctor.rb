class Doctor < ApplicationRecord
    has many :doctor_time
    has many :appointment
end