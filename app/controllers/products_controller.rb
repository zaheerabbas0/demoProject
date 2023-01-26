class ProductsController < ApplicationController
  before_action :set_product, only: %i[ edit update destroy]
  before_action :authenticate_user!, only: %i[create new edit update destroy] 
  def index
    cate=Category.find_by(id: params[:category_id])
    if params[:search].present? && params[:category_id].present?
      pro=cate.products.where("name ILIKE ?", "%#{params[:search]}%")
      @products=pro.paginate(page: params[:page], per_page: 15)
    elsif params[:category_id].present?
      @products= cate.products.paginate(page: params[:page], per_page: 15)
    elsif params[:search].present?
      pro=Product.where("name ILIKE ?", "%#{params[:search]}%")
      @products=pro.paginate(page: params[:page], per_page: 15)
    else
      @products= Product.paginate(page: params[:page], per_page: 15)
    end
  end

  def show
    @product=Product.find(params[:id])
  end

  def new
    @product = Product.new(user: current_user)
  end
  def edit
    @product = Product.find(params[:id])
  end
  def create
    # @product = current_user.products.build(product_params)
       @product=ProductCreator.new( 
       name: params[:product][:name],
       price: params[:product][:price],
       details: params[:product][:details],
       image: params[:product][:image], 
       category_id: params[:product][:category_id], 
       quantity: params[:product][:qauntity],
       current_user: current_user.id).create_product
       respond_to do |format|
        if @product.save
          format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
        
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:c_name, :category_id, :qauntity, :image, :name, :price, :current_user, :details, :search, :category)
    end
end
