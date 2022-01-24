class Doottothedoot < ActiveRecord::Migration[7.0]
  def change
    remove_index :recipe_ingredients, name: "index_recipe_ingredients_on_recipe_id"
  end
end
