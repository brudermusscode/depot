class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :reviews
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true

  validates :title, uniqueness: true, length: {
    minimum: 10,
    maximum: 200
  }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i,
    message: 'only gif, jpg or png'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items are present')
      throw :abort
    end
  end
end
