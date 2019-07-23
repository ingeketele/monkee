class Order < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  has_one :activity_review
end
