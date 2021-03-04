class ChangeUsersColimn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_height, :integer
    remove_column :users, :height, :integer
  end
end
