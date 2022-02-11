class RenameColumnDeletedToDisabled < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :deleted, :disabled
    add_column :users, :disabled_at, :timestamp
  end
end
