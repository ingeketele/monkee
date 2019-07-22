class ActivityReview < ApplicationRecord
  belongs_to :order

  validates :rating, :comment, presence: true
end
