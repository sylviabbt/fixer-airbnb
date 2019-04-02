class ChangeTypeStartTime < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :start_time, :time, using: 'start_time::time'
    change_column :bookings, :end_time, :time, using: 'end_time::time'
  end
end
