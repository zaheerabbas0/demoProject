class RenamePDetailsToDetailsInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :p_details, :details
  end
end
