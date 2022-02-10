class AdminController < ApplicationController
  def index
    @total_orders = Order.count
    @users = User.all
    @total_users = User.count
  end
end
