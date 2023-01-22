class DriveRoute < ApplicationRecord
  has_many :drive_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :routes, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  belongs_to :user

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def liked_by?(user)
    # モデル名.exists?(任意のカラム名: 格納されている値)
    likes.exists?(user_id: user.id)
  end
end
