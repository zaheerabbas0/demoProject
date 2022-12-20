class CartsController < ApplicationController
  
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    render json: {sub_total: @cart.sub_total}
  end  
end
