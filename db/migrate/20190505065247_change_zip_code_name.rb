class ChangeZipCodeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :owners, :zip_code, :address
  end
end
