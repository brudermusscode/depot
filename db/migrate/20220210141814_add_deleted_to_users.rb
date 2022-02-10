class AddDeletedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted, :integer, default: 0
  end
end
