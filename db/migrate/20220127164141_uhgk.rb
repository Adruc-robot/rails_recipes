class Uhgk < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :global, :string, :default => "F"
    add_column :recipes, :status, :string, :default => "IP"
  end
end
