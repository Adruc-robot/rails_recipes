class AddThisToThat3 < ActiveRecord::Migration[7.0]
  def change
    change_column :locations, :global, :string, :default => "F"
  end
end
