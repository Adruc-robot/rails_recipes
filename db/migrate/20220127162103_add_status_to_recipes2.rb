class AddStatusToRecipes2 < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :global, :string, :default => "IP"
    remove_column :recipe_ingredients, :global
  end
end
