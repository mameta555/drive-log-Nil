class DriveReport < ApplicationRecord
  belongs_to :user
  has_many :routes, dependent: :destroy
  
  validates :title, presence: true
  
  enum status: { yet: 0, already: 1 }
end
