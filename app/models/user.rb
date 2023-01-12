class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :drive_routes, dependent: :destroy
  has_many :drive_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :routes, dependent: :destroy
  has_many :drive_report, dependent: :destroy
end
