class CreateMealPreps < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_preps do |t|
      t.references :users, null: false, foreign_key: true
      t.date :meal_date
      t.string :meal_type
      t.references :recipes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
