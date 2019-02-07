class Card < ApplicationRecord
  belongs_to :region
  belongs_to :prefecture
  belongs_to :user

  attachment :card_image
end
