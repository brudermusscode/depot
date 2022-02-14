class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :reviews

  # validate the uniqueness of mail and name to prevent duplication
  validates_uniqueness_of :email
  validates_uniqueness_of :name

  # add customer role after creating new user
  after_create :assign_default_role

  def assign_default_role
    add_role(:customer) if roles.blank?
  end

  def disable
    self.disabled_at = Time.now
  end

  def disabled?
    disabled_at?
  end
end
