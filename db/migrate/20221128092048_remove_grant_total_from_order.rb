class RemoveGrantTotalFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :grant_total, :float
  end
end
