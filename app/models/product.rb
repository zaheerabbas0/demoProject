class Product < ApplicationRecord
    has_many :prcomments, dependent: :destroy
    belongs_to :category
    belongs_to :user
    has_many :line_items, dependent: :destroy
    mount_uploader :image, ImageUploader, :mount_on => :image
end
