class ChangeavailabilityFormatToSkills < ActiveRecord::Migration[5.2]
  def change
    change_column :skills, :earliest_available, :time, using: 'earliest_available::time'
    change_column :skills, :latest_available, :time, using: 'latest_available::time'
  end
end
