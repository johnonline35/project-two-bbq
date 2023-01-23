class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.text :location
      t.integer :user_id
      t.integer :grill_id

      t.timestamps
    end
  end
end
