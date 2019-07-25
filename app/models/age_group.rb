class Agegroup < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
