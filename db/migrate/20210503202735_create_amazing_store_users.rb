class CreateAmazingStoreUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :amazing_store_users do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
