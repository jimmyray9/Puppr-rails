class CreateWalkers < ActiveRecord::Migration[5.2]
  def change
    create_table :walkers do |t|
      t.string :name
      t.string :pic
      t.string :phone
      t.string :zip_code
      t.integer :avg_rating

      t.timestamps
    end
  end
end
