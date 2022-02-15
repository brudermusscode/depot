class AdminController < ApplicationController
  def index
    @orders = Order.eager_load(:products).all
    @users = User.all
  end
end
