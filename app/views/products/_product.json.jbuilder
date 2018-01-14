json.extract! product, :id, :user_id, :category_id, :name, :description, :minimal_price, :current_price, :auction_status, :created_at, :updated_at
json.url product_url(product, format: :json)
