class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :start_time
      t.string :end_time
      t.integer :total_price
      t.string :address
      t.string :contact_info
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
