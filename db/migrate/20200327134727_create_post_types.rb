class CreatePostTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_types do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
