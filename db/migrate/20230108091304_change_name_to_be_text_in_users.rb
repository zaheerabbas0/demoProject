class ChangeNameToBeTextInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :name, :text
    end
end
