class AddChargeIdAndChargeCreatedAndChargeEmailToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :charge_id, :string
    add_column :bookings, :charge_email, :string
    add_column :bookings, :charge_created, :integer
  end
end
