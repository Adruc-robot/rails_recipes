class ChangeThisintothat < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredients, :state_id
    add_index :ingredients, :location_id
  end
end
