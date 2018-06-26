class AddHourToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :hour, :integer
  end
end
