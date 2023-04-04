class CreateDoctorAvailableTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_available_times, id: :uuid do |t|
      t.date :date
      t.time :time
      t.boolean :available
      t.references :appointments, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
