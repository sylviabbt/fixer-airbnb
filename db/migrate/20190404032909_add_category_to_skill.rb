class AddCategoryToSkill < ActiveRecord::Migration[5.2]
  def change
    add_reference :skills, :category, foreign_key: true
  end
end
