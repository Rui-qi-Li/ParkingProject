class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :name
      t.integer :cost
      t.text :address
      t.integer :user_id
      t.timestamps
    end
    add_index :bookings, :user_id
  end
end
