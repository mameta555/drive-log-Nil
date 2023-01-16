class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy
  has_many :drive_routes, through: :tag_relationships

  validates :tag_name, uniqueness: true
end
