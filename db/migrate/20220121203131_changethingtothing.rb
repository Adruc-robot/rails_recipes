class Changethingtothing < ActiveRecord::Migration[7.0]
  def change
    rename_column :ingredients, :state, :state_id
    rename_column :ingredients, :location, :location_id
  end
end
