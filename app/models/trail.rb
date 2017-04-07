class Trail < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true
  validates :name, presence: true

  has_many :maintenancetickets

  mount_uploader :picture, TrailsUploaderUploader



end
