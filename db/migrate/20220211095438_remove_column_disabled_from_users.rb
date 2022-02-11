class RemoveColumnDisabledFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :disabled
  end
end
