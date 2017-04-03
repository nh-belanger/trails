class Maintenanceticket < ApplicationRecord
  validates :location, presence: true
  validates :body, presence: true

  belongs_to :trail, optional: true #trying to fix weird form error
end
