class Facility < ApplicationRecord

  has_many :distributes
  Geocoder.configure(language: :ja)

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
