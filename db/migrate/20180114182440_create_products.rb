class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.text :description
      t.decimal :minimal_price
      t.decimal :current_price
      t.boolean :auction_status

      t.timestamps
    end
  end
end
