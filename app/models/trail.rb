class Trail < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  
  validates :address, presence: true
  validates :name, presence: true
end
