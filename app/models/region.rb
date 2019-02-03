class Region < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :prefectures, dependent: :destroy
  has_many :dams, dependent: :destroy
end
