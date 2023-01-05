class RenamePNameToNameInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :p_name, :name
  end
end
