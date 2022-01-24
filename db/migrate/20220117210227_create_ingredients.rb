class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.integer :the_key
      t.string :name
      t.integer :state
      t.integer :location
      t.integer :user_id
      t.boolean :global

      t.timestamps
    end
  end
end
