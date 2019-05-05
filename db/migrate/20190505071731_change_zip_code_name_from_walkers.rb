class ChangeZipCodeNameFromWalkers < ActiveRecord::Migration[5.2]
  def change
    rename_column :walkers, :zip_code, :address
  end
end
