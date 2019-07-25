class Order < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  has_one :activity_review, dependent: :destroy

  monetize :amount_cents
end
