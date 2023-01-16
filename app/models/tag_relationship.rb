class TagRelationship < ApplicationRecord
  belongs_to :drive_route
  belongs_to :tag
end
