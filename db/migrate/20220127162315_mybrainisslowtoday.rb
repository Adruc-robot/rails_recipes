class Mybrainisslowtoday < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_steps, :global
  end
end
