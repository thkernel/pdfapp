class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :post_type, foreign_key: true
      t.references :post_category, foreign_key: true
      t.text :content
      t.string :status
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
