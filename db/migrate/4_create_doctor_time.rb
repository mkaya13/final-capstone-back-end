class CreateDoctorTime < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_times, id: :uuid do |t|
      t.references :doctor, null: false, foreign_key: true, type: :uuid
      t.references :time_schedule, null: false, foreign_key: true, type: :uuid
      t.string :day

      t.timestamps
    end
  end
end
