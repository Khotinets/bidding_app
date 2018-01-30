class Auction < ApplicationRecord
    belongs_to :product
    belongs_to :user
    has_many :bids
    
    validates_uniqueness_of :product_id
end
