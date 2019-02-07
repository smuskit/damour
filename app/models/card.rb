class Card < ApplicationRecord
  belongs_to :region
  belongs_to :prefecture
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  # accepts_nested_attributes_for :images
end
