class Updatemealpreps < ActiveRecord::Migration[7.0]
  def change
    rename_column :meal_preps, :recipes_id, :recipe_id
  end
end
