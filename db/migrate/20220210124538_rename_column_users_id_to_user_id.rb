class RenameColumnUsersIdToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :users_id, :user_id
  end
end
