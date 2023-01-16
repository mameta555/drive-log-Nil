class Route < ApplicationRecord
  belongs_to :user
  belongs_to :drive_route
  has_many :drive_reports, dependent: :destroy
  
  has_one_attached :route_image
end
