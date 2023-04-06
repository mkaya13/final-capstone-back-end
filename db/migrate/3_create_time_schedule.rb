class CreateTimeSchedule < ActiveRecord::Migration[7.0]
  def change
    create_table :time_schedules, id: :uuid do |t|
      t.string :time_from
      t.string :time_to

      t.timestamps
    end
  end
end
