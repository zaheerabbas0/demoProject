class Product < ApplicationRecord
    has_many :prcomments, dependent: :destroy
    validates :p_name, :p_price, :image, presence: true
    belongs_to :category
    belongs_to :user
    has_many :line_items, dependent: :destroy
    mount_uploader :image, ImageUploader, :mount_on => :image

    # def to_s
    # p_name
    # end
    # def to_builder
    #     Jbuilder.new do|product|
    #         product.p_price stripe_price_id
    #         product.quantity 1
    #     end
    # end       
end
