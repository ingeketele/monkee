class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :activity_reviews, through: :orders
  has_many :activity_categories, dependent: :destroy
  has_many :categories, through: :activity_categories

  validates :title, :address, :date, :description, :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def display_time
    date.strftime("%A, %d %B at %k:%M")
  end
end
