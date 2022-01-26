class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart, optional: true

  def total_price
    product.price * quantity
  end

  def info
    merge Product.find_by id: :product_id
    merge Order.find_by id: :order_id
  end

  def orderinfo
    Order.find_by id: :order_id
  end
end
