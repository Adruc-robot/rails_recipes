class CreateRecipeSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_steps do |t|
      t.belongs_to :recipe, index: true
      t.integer :step_number
      t.string :step_text
      t.belongs_to :user, index: true
      t.string :global, :default => "F"

      t.timestamps
    end
    
  end
end
