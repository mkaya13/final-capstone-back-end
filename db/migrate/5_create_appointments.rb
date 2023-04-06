class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.string :description
      t.date :date
      t.time :time
      t.references :doctor, null: false, foreign_key: true, type: :uuid
      t.references :users, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
