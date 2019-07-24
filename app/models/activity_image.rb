class ActivityImage < ApplicationRecord
  belongs_to :activity

  mount_uploader :photo, PhotoUploader
end
