class Doctor < ApplicationRecord
    has many :doctor_times
    has many :appointments
end