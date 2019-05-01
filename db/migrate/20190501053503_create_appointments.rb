class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :duration
      t.string :note
      t.string :start_time
      t.string :date
      t.string :location
      t.boolean :is_scheduled
      t.string :comment
      t.integer :rating
      t.references :walker, foreign_key: true

      t.timestamps
    end
  end
end
