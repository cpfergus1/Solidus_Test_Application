class AddLikesCountToSpreeProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :likes_count, :integer
  end
end
