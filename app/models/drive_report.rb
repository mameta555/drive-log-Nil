class DriveReport < ApplicationRecord
  belongs_to :user
  belongs_to :route, dependent: :destroy
end
