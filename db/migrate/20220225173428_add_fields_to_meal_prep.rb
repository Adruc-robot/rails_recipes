class AddFieldsToMealPrep < ActiveRecord::Migration[7.0]
  def change
    add_column :meal_preps, :start_time, :date_time
    add_column :meal_preps, :end_time, :date_time
  end
end
