class Card < ApplicationRecord
  belongs_to :region
  belongs_to :prefecture
  belongs_to :user

  mount_uploaders :images, ImageUploader
  # serialize :images, JSON
end
