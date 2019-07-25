class UsersController < ApplicationController
  def dashboard
    @orders = Order.where(user: current_user)
    @activities = Activity.where(user: current_user)
    @reviews = []
    @orders.each { |order| @reviews << order.activity_review if order.activity_review.present? }

    @activity_review = ActivityReview.new
  end
end
