class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites
  has_many :followers, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :avatar, PhotoUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  def my_paid_orders
    Order.where(user: self, status: 'paid', activity: Activity.where("date > ? ", Time.now)).sort_by { |order| order.activity.date }
  end

  def favorited_activity?(activity)
    favorites.where(activity: activity).any?
  end

  def find_favorite(activity)
    favorites.where(activity: activity).first
  end

  def people_i_follow
    Follower.where(follower_id: self.id)
  end

  def people_who_follow_me
    Follower.where(user_id: self.id)
  end

  def follows?(user)
    user.followers.where(follower_id: self.id).any?
  end

  def find_follow_id(user)
    user.followers.where(follower_id: self.id).first
  end

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
    end
  end

  private

  def average_rating
    ratings = []
    activities = Activity.where(user: self)
    activities.each { |activity| ratings << activity.average_rating }

    if ratings.empty? || ratings.nil?
      -1
    else
      ratings.sum / ratings.count
    end
  end
end
