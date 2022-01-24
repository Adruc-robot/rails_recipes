class AddThisToThat < ActiveRecord::Migration[7.0]
  def change
    change_column :ingredients, :global, :boolen, :default => false
    change_column :states, :global, :boolean, :default => false
    change_column :units, :global, :boolean, :default => false
  end
end
