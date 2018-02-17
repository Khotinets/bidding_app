class AddEndsAtandStartsAtToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :starts_at, :datetime
    add_column :auctions, :ends_at, :datetime
  end
end
