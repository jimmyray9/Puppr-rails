class AddStatusToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :is_completed, :boolean
  end
end
