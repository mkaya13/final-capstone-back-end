class AddTimeScheduleToDoctorTime < ActiveRecord::Migration[7.0]
  def change
    add_reference :doctor_times, :time_schedule, null: false, foreign_key: true, type: :uuid, index:true
  end
end
