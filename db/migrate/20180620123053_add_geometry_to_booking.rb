class AddGeometryToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :latitude, :float
    add_column :bookings, :longtitude, :float
  end
end
