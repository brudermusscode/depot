class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true
  validates :body, presence: true

  def userinfo
    User.find_by id: user_id
  end
end
