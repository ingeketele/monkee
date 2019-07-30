class UsersController < ApplicationController
  def dashboard
    @orders = Order.where(user: current_user)

    @activities = Activity.where(user: current_user)
    @activity_review = ActivityReview.new

    @favorites = Favorite.where(user: current_user)

    @my_reviews = []
    @orders.each { |order| @my_reviews << order.activity_review if order.activity_review.present? }

    @about_reviews = []
    @activities.each do |activity|
      activity.orders.each { |a_order| @about_reviews << a_order.activity_review if a_order.activity_review.present? }
    end
  end

  def newsfeed
    if params.dig(:add_friend, :name).present?
      search = params.dig(:add_friend, :name)
      sql_query = "first_name ILIKE :name OR last_name ILIKE :name"
      @find_friends = User.where(sql_query, name: "%#{search}%")
    else
      @find_friends = []
    end

    @suggested_friends = User.where.not(id: current_user.id).shuffle.first(5)

    my_friends_favorites = []
    @my_friends_favorite_activities = []
    current_user.people_i_follow.each do |follow|
      friend = User.find(follow.user_id)
      my_friends_favorites << friend.favorites
    end
    my_friends_favorites.flatten.each do |favorite|
      @my_friends_favorite_activities << favorite.activity
    end
  end
end
