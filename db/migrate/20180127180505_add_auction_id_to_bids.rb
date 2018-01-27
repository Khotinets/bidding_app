class AddAuctionIdToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :auction_id, :integer
  end
end
