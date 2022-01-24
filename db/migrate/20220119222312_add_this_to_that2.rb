class AddThisToThat2 < ActiveRecord::Migration[7.0]
  def change
    change_column :ingredients, :global, :string, :default => "F"
    change_column :states, :global, :string, :default => "F"
    change_column :units, :global, :string, :default => "F"
  end
end
