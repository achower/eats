class AddUserIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :user_id, :integer
    add_index :restaurants, :user_id
  end
end
