class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity, limit:8

      t.timestamps
    end
  end
end
