class Follower < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user, scope: :follower_id
  validates :follower_id, presence: true
end
