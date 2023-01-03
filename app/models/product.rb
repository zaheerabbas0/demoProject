class Product < ApplicationRecord
    has_many :prcomments, dependent: :destroy
    validates :p_name, :p_price, :image, presence: true
    belongs_to :category
    belongs_to :user
    has_many :line_items, dependent: :destroy
    mount_uploader :image, ImageUploader, :mount_on => :image

    def self.search(search)
        # if search
            cate=Category.find_by("c_name LIKE ?", "%#{search}%")
            cate.products
            # byebug
            # if product
            #     self.where(Category_id: product)
            #     else
            #         @products=Product.all
            #     end
            # else
            # @products=Product.all
        # end
    end
end
