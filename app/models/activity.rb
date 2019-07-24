class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :activity_reviews, through: :orders
  has_many :activity_categories, dependent: :destroy
  has_many :categories, through: :activity_categories
  has_many :activity_images, dependent: :destroy
  accepts_nested_attributes_for :activity_images

  validates :title, :address, :date, :description, :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def stars
    if average_rating == 0
      '<i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>'.html_safe
    elsif average_rating == 1
      '<i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>'.html_safe
    elsif average_rating == 2
      '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>'.html_safe
    elsif average_rating == 3
      '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>'.html_safe
    elsif average_rating == 4
      '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>'.html_safe
    elsif average_rating == 5
      '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>'.html_safe
    else
      '(no ratings yet)'
    end
  end

  def average_rating
    ratings = []
    orders = Order.where(activity_id: id)
    orders.each do |order|
      ratings << Review.find_by(order_id: order.id).rating if Review.exists?(order_id: order.id)
    end
    if ratings.empty? || ratings.nil?
      "no ratings yet"
    else
      ratings.sum / ratings.count
    end
  end
end
