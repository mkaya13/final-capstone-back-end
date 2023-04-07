class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid, index:true
      t.references :doctor, null: false, foreign_key: true, type: :uuid, index:true
      t.references :doctor_appointment_time, null: false, foreign_key: true, type: :uuid, index:true

      t.string :description
      t.date :date
      t.string :time_from
      t.string :time_to
      t.boolean :cancelled

      t.timestamps
    end
  end
end