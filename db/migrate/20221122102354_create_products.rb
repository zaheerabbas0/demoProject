class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :details
      # t.string :qauntity
      t.timestamps
    end
  end
end
