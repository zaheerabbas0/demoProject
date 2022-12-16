class CreatePrcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :prcomments do |t|
      t.string :commenter
      t.text :body
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
