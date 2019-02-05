class Image < ApplicationRecord
  belongs_to :card

  mount_uploader :dam_image, ImageUploader
end