class AddRejectedToSpreeOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :rejected, :boolean
  end
end
