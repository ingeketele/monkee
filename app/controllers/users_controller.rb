class UsersController < ApplicationController
  before_action :set_categories, :set_age_group, only: [:dashboard, :newsfeed]

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
    my_friends_activities = []
    my_friends_orders = []
    @my_friends_favorite_activities = []
    @hosted_by_my_friends = []
    @reviewed_by_my_friends = []
    current_user.people_i_follow.each do |follow|
      friend = User.find(follow.user_id)
      my_friends_favorites << friend.favorites
      my_friends_activities << friend.activities
      my_friends_orders << friend.orders
    end

    my_friends_favorites.flatten.each do |favorite|
      @my_friends_favorite_activities << favorite.activity
    end

    my_friends_activities.flatten.each do |activity|
      @hosted_by_my_friends << activity
    end

    my_friends_orders.flatten.each do |order|
      @reviewed_by_my_friends << order.activity_review if order.activity_review.present?
    end
  end

  private

  def set_categories
    @categories = ["Courses", "Creative", "Mindfulness", "Music & Dance", "Playdates", "Outdoors", "Indoors", "Sports", "Farm Day", "Culture"]
  end

  def set_age_group
    @age_group = ["Babies", "Toddlers", "3-5 years", "6-9 years", "+9 years", "For all"]
  end
end
