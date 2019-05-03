class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :zip_code
      t.integer :user_id

      t.timestamps
    end
  end
end
