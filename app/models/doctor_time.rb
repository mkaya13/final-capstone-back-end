class DoctorTime < ApplicationRecord
    belongs_to :doctor
    has_many :time_schedules
end