class RemoveTexFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :tex, :float
  end
end
