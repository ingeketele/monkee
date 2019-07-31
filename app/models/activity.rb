class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :activity_reviews, through: :orders
  has_many :activity_categories, dependent: :destroy
  has_many :categories, through: :activity_categories
  has_many :age_groups, through: :age_group
  has_many :favorites
  has_many :activity_images, dependent: :destroy
  accepts_nested_attributes_for :activity_images

  validates :title, :address, :date, :description, :duration, :category, :age_group, :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  monetize :price_cents

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
      ratings << ActivityReview.find_by(order_id: order.id).rating if ActivityReview.exists?(order_id: order.id)
    end
    if ratings.empty? || ratings.nil?
      -1
    else
      ratings.sum / ratings.count
    end
  end

  def display_time
    date.strftime("%A, %d %B at %k:%M")
  end

  def end_time
    date + duration.hours
  end

  def tickets_left
    booked_tickets = Order.where(status: 'paid', activity: id).map { |order| order.number_of_tickets }
    capacity - booked_tickets.sum
  end
end
