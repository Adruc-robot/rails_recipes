class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.integer :the_key
      t.string :name
      t.integer :user_id
      t.boolean :global

      t.timestamps
    end
  end
end
