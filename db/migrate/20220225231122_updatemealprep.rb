class Updatemealprep < ActiveRecord::Migration[7.0]
  def change
    change_column :meal_preps, :start_time, :datetime
    change_column :meal_preps, :end_time, :datetime
  end
end
