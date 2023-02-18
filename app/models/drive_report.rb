class DriveReport < ApplicationRecord
  belongs_to :user
  has_many :routes, dependent: :destroy
  accepts_nested_attributes_for :routes, allow_destroy: true
  validates :title, presence: true
  
  enum status: { yet: 0, already: 1 }
end
