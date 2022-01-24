class AddUserIdToThings < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredients, :user_id
    add_index :states, :user_id
    add_index :units, :user_id
    
  end
end
