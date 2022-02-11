class ChangeDisabledToBeBooleanInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :disabled, :boolean
  end
end
