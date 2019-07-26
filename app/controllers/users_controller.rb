class UsersController < ApplicationController
  def dashboard
    @orders = Order.where(user: current_user)
    @paid_orders = Order.where(status: 'paid', activity: Activity.where("date > ? ", Time.now)).sort_by { |order| order.activity.date }
    @activities = Activity.where(user: current_user)
    @favorites = Favorite.where(user: current_user)

    @reviews = []
    @orders.each { |order| @reviews << order.activity_review if order.activity_review.present? }

    @activity_review = ActivityReview.new
  end
end
