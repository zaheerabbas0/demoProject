class RenamePrcommentsToComment < ActiveRecord::Migration[5.1]
  def change
    rename_table :prcomments, :comments
  end
end
