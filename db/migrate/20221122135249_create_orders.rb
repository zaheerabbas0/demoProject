class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.float :tex
      t.float :discount
      t.float :grant_total

      t.timestamps
    end
  end
end
