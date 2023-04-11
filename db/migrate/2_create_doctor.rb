class CreateDoctor < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :major
      t.string :profile_picture
      t.float :fees
      t.string :available_time

      t.timestamps
    end
  end
end
