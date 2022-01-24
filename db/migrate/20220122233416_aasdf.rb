class Aasdf < ActiveRecord::Migration[7.0]
  def change
    remove_index :recipe_ingredients, name: "index_recipe_ingredients_on_ingredient_id"
    remove_index :recipe_ingredients, name: "index_recipe_ingredients_on_unit_id"
    remove_index :recipe_ingredients, name: "index_recipe_ingredients_on_user_id"
  end
end
