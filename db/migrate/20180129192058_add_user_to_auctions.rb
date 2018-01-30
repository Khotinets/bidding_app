class AddUserToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :auctions, :users
    add_foreign_key :auctions, :products
    add_index :auctions, :product_id, :unique => true
  end
end
