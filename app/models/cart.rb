class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    # like 'SELECT product_id FROM line_items WHERE product.id = product.id'
    current_item = line_items.find_by product_id: product.id

    if current_item
      # just increase quantity
      # like 'UPDATE line_items SET quantity += 1 WHERE product_id = product.id
      current_item.quantity += 1
      # increase product price, since we are having more than one item now
      current_item.price += product.price
    else
      # Like 'INSERT INTO line_items (product_id) VALUES (product.id)'
      current_item = line_items.build product_id: product.id, price: product.price
    end

    # return the value of current_item
    current_item
  end

  def remove_product(line_item)
    current_item = line_items.find_by id: line_item.id
    current_item_amount = current_item.quantitiy

    if current_item.quantity > 1
      current_item.quantity -= 1
      current_item.price = (current_item.price / current_item_amount) * current_item.quantity
    else
      current.item.destroy
    end
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end
end
