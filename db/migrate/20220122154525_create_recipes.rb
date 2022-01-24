class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.string :global, :default => "F"
      t.timestamps
    end
  end
end
