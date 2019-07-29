class UsersController < ApplicationController
  def dashboard
    @orders = Order.where(user: current_user)
    @paid_orders = Order.where(status: 'paid', activity: Activity.where("date > ? ", Time.now)).sort_by { |order| order.activity.date }

    @activities = Activity.where(user: current_user)
    @activity_review = ActivityReview.new

    @favorites = Favorite.where(user: current_user)

    @my_reviews = []
    @orders.each { |order| @my_reviews << order.activity_review if order.activity_review.present? }

    @about_reviews = []
    @activities.each do |activity|
      activity.orders.each { |a_order| @about_reviews << a_order.activity_review }
    end
  end

  def newsfeed
    name = params[:name]
  end
end
