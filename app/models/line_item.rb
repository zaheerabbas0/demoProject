class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart
    
    def total_price
        self.quantity * self.product.p_price
    end
end
