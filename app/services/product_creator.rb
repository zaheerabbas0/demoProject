class ProductCreator
  attr_reader :current_user
  def initialize(name:, price:, details:, image:, category_id:, quantity:, current_user:)
    @name = name
    @price = price
    @details = details 
    @image = image
    @category_id = category_id
    @qauntity = quantity
    @current_user=current_user
  end

  
  # def call
  #   create_product
  # end
  def create_product
    Product.create!(name: @name, price: @price, details: @detials, image: @image,  category_id:  @category_id, qauntity: @qauntity, user_id:@current_user)
  end
end
