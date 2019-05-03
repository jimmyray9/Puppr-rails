class CreateWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :walks do |t|
      t.references :dog, foreign_key: true
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
