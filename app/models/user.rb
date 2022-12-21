class User < ApplicationRecord
  has_many :Products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :image, ImageUploader, :mount_on => :image

end
