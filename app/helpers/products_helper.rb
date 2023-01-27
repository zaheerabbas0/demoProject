module ProductsHelper
  def add_to_cart_btn(product) 
    if current_user 
      out = ''
      if (product.user_id == current_user.id) 
         out<< link_to('Edit', edit_product_path(product))
         out << '<p class="destroy"> Destroy </p>'
        else
         out << '<span class="add-item"> Add to cart </span>'
      end 
    end
    out.html_safe 
  end
  def show_page_btn
    if current_user 
      out = '' 
      if !(@product.user_id == current_user.id) 
        out << '<p class="show-card-id">'
        out << '</p>'
        out << '<span class="show-item"> Add to cart</span>'
      end
    end
    out.html_safe
  end
  def show_page_edit_btn
    if current_user 
      out = '' 
      if !(@product.user_id == current_user.id) 
        out<< link_to('Edit', edit_product_path(@product))
      end
    end
    out.html_safe
  end
end
