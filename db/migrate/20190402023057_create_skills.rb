class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :title
      t.integer :price_per_hour
      t.string :earliest_available
      t.string :latest_available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
