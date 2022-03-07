class AddDAmntToRi < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :damount, :decimal
  end
end
