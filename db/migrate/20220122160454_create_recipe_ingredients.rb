class CreateRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
      t.belongs_to :unit, index: true
      t.string :prep_instructions
      t.belongs_to :user, index: true
      t.string :global

      t.timestamps
    end
  end
end
