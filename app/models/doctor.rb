class Doctor < ApplicationRecord
    has_many :doctor_times
    has_many :appointments
end