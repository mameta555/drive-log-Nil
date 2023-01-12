class DriveRoute < ApplicationRecord
  has_many :drive_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :routes
  has_many :tag_relationships, dependent: :destroy
  belongs_to :user
end
