class Auction < ApplicationRecord
    belongs_to :product, -> {where auction_status: true}
    belongs_to :user
    
end
