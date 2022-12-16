class PrcommentsController < ApplicationController
     def create
     @product = Product.find(params[:product_id])
    @prcomment = @product.prcomments.create(prcomment_params)
    redirect_to product_path(@product)
  end
 
  private
    def prcomment_params
      params.require(:prcomment).permit(:commenter, :body)
    end
end
