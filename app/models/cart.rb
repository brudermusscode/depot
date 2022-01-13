class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    # like 'SELECT product_id FROM line_items WHERE product.id = product.id'
    current_item = line_items.find_by product_id: product.id

    if current_item
      # just increase quantity
      # like 'UPDATE line_items SET quantity += 1 WHERE product_id = product.id
      current_item.quantity += 1
    else
      # Like 'INSERT INTO line_items (product_id) VALUES (product.id)'
      current_item = line_items.build product_id: product.id
    end

    # return the value of current_item
    current_item
  end
end