class AddSpreeFieldsToCustomUserTable < ActiveRecord::Migration[4.2]
  def up
    add_column "amazing_store_users", :spree_api_key, :string, :limit => 48
    add_column "amazing_store_users", :ship_address_id, :integer
    add_column "amazing_store_users", :bill_address_id, :integer
  end
end
