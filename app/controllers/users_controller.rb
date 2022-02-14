class UsersController < ApplicationController
  before_action :set_user

  def orders
    @total_orders = @user.orders.count
  end

  def reviews
    @total_reviews = @user.reviews.count
  end

  private

  def set_user
    @user = User.find params[:id]
  end
end
