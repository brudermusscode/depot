class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true
  validates :body, presence: true
end
