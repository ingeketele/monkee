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
end
