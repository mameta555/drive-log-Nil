class DriveComment < ApplicationRecord
  belongs_to :user
  belongs_to :drive_route
  
  validates :comment, presence: true
end
