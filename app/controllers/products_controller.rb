class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy] 
  def index
    if params[:search].present? && params[:category_id].present?
      cate=Category.find_by(id: params[:category_id])
      pro=cate.products.where("name ILIKE ?", "%#{params[:search]}%")
      @products=pro.paginate(page: params[:page], per_page: 15)
    elsif params[:category_id].present?
      cate=Category.find_by(id: params[:category_id])
      @products= cate.products.paginate(page: params[:page], per_page: 15)
    elsif params[:search].present?
      pro=Product.where("name ILIKE ?", "%#{params[:search]}%")
      @products=pro.paginate(page: params[:page], per_page: 15)
    else
      @products= Product.paginate(page: params[:page], per_page: 15)
    end
  end

  def show;  end

  def new
    @product = Product.new(user: current_user)
  end
  def edit
    @product = Product.find(params[:id])
  end
  def create
    @product = current_user.products.build(product_params)
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
      params.require(:product).permit(:c_name, :category_id, :qauntity, :image, :name, :price, :details, :search,:category)
    end
end
