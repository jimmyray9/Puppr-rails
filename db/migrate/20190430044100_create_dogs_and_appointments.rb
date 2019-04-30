class CreateDogsAndAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :duration
      t.string :note
      t.datetime :start_time
      t.datetime :date
      t.string :location
      t.boolean :is_scheduled
      t.string :comment
      t.integer :rating
      t.references :walker, foreign_key: true

      t.timestamps
    end

    create_table :dogs do |t|
      t.string :breed
      t.string :size
      t.string :description
      t.integer :age
      t.string :name
      t.string :pic
      t.string :gender
      t.references :owner, foreign_key: true

      t.timestamps
    end

    create_table :dogs_appointments, id: false do |t|
      t.belongs_to :dog, index: true
      t.belongs_to :appointment, index: true
    end
  end
end
