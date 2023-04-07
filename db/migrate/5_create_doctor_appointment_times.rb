class CreateDoctorAppointmentTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_appointment_times, id: :uuid do |t|
      t.references :doctor_time, null: false, foreign_key: true, type: :uuid, index:true
      t.references :doctor, null: false, foreign_key: true, type: :uuid, index:true
      t.date :date
      t.string :time_from
      t.string :time_to
      t.boolean :available

      t.timestamps
    end
  end
end