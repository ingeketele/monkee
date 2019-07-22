class UsersController < ApplicationController
  def dashboard
    @orders = Order.where(user: current_user)
    @activities = Activity.where(user: current_user)
    @reviews = @orders.map { |order| order.review }
  end
end
