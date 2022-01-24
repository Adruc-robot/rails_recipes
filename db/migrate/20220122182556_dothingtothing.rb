class Dothingtothing < ActiveRecord::Migration[7.0]
  def change
    change_column :recipe_ingredients, :global, :string, :default => "F"
  end
end
