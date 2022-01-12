class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true

    validates :title, uniqueness: true, length: {
        minimum: 10,
        maximum: 200
    }
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\z}i,
        message: 'only gif, jpg or png'
    }
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end