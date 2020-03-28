class CreatePostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_categories do |t|
      t.string :name
      t.integer :parent_category
      t.text :description
      t.string :status
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
