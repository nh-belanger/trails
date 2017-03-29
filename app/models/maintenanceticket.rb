class Maintenanceticket < ApplicationRecord
  validates :location, presence: true
  validates :body, presence: true

  belongs_to :trail
end
