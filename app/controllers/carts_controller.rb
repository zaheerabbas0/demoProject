class CartsController < ApplicationController
  
  def show
    # @cart = LineItem.find(params[:id])
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    render json: {sub_total: @cart.sub_total}
  end

  private
  # def set_product
  #   @cart = Cart.find(params[:id])
  # end

  def cart_params
    params.require(:cart).permit(:id, params(:id))
  end
  
end
