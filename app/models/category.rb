class Category < ApplicationRecord
has_many :products
end


# @cart =  LineItem.find(params[:id])
# @cart.destroy
# session[:cart_id] = nil
# render json: {sub_total: @cart.sub_total}