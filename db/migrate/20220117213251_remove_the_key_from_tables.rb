class RemoveTheKeyFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :states, :the_key, :integer
    remove_column :units, :the_key, :integer
    remove_column :ingredients, :the_key, :integer
  end
end
