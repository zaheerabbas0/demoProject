class RemoveDiscountFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :discount, :float
  end
end
