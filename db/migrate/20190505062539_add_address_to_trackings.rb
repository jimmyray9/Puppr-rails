class AddAddressToTrackings < ActiveRecord::Migration[5.2]
  def change
    add_column :trackings, :address, :string
  end
end
