class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :p_name
      t.float :p_price
      t.text :p_details
      # t.string :qauntity
      t.timestamps
    end
  end
end
