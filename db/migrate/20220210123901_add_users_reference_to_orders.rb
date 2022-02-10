class AddUsersReferenceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :users, null: true, foreign_key: true
  end
end
