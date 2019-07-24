class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_name
    "#{first_name} #{last_name}"
  end

  def favorited_activity?(activity)
    favorites.where(activity: activity).any?
  end

  def find_favorite(activity)
    favorites.where(activity: activity).first
  end
end
