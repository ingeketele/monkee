class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  validates :user, uniqueness: { scope: :activity, message: "has already added this activity"}
end
