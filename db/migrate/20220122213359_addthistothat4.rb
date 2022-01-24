class Addthistothat4 < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :amount, :string
  end
end
