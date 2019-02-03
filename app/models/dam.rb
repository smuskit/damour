class Dam < ApplicationRecord
  has_many :distributes, dependent: :destroy
  belongs_to :region
  belongs_to :prefecture
end
