class RemoveLatitudeAndLongtitudeFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :latitude, :float
    remove_column :bookings, :longtitude, :long
  end
end
