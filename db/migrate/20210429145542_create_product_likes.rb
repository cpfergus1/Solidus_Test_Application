class CreateProductLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :product_likes do |t|
      t.integer :user_id, null: false
      t.integer :product_id, null: false

      t.foreign_key :spree_users, column: :user_id, on_delete: :cascade
      t.foreign_key :spree_products, column: :product_id, on_delete: :cascade

      t.timestamps
    end
  end
end
