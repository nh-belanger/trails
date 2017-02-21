class Trail < ApplicationRecord
  validates :length, numericality: true
  validates :trailhead_lat, numericality: true
  validates :trailhead_long, numericality: true
  validates :address, presence: true
  validates :name, presence: true
end
