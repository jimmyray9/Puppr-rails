class CreateDogs < ActiveRecord::Migration[5.2]
  def change
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
  end
end
