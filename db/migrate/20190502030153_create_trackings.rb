class CreateTrackings < ActiveRecord::Migration[5.2]
  def change
    create_table :trackings do |t|
      t.string :longitude
      t.string :latitude
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
