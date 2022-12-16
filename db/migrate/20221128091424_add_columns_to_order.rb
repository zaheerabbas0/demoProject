class AddColumnsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :email, :string
    add_column :orders, :address, :text
    add_column :orders, :pay_method, :string
  end
end
