class AddDoctorTimeToTimeSchedule < ActiveRecord::Migration[7.0]
  def change
    add_reference :time_schedules, :doctor_time, null: false, foreign_key: true, type: :uuid, index:true
  end
end
