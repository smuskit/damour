class Facility < ApplicationRecord
  has_many :distributes, dependent: :destroy
end
