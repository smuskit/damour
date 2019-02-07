class Prefecture < ApplicationRecord
  has_many :dams, dependent: :destroy
  belongs_to :region
end
