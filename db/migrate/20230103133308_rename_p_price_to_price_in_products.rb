class RenamePPriceToPriceInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :p_price, :price
  end
end
