class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, :price, :image, presence: true
  belongs_to :category
  belongs_to :user
  has_many :line_items, dependent: :destroy
  mount_uploader :image, ImageUploader, mount_on: :image
end
