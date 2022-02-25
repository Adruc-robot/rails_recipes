class Updateusersidonmealprep < ActiveRecord::Migration[7.0]
  def change
    rename_column :meal_preps, :users_id, :user_id
  end
end
