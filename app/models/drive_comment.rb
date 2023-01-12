class DriveComment < ApplicationRecord
  belongs_to :user
  belongs_to :drive_route
end
