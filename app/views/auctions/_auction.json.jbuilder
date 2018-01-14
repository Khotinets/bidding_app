json.extract! auction, :id, :product_id, :user_id, :created_at, :updated_at
json.url auction_url(auction, format: :json)
