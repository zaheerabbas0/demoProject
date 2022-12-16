class AddQauntityToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :qauntity, :int
  end
end
