class Activity < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :activity_reviews, through: :orders
  has_many :activity_categories, dependent: :destroy
  has_many :categories, through: :activity_categories

  validates :title, :address, :date, :description, :capacity, presence: true
end
