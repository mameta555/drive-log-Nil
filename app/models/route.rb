class Route < ApplicationRecord
  belongs_to :user
  belongs_to :drive_route
  belongs_to :drive_report, optional: true
  
  has_one_attached :destination_image
  
  validates :destination, presence: true
  validates :status, presence: true
  
  def get_destination_image(width, height)
    unless destination_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      destination_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    destination_image.variant(resize_to_limit: [width, height]).processed
  end
end
