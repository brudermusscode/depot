class AdminController < ApplicationController
  def index
    @orders = Order.all.reverse_order
    @users = User.all.reverse_order
  end
end
