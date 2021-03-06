class Product < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_one :auction, dependent: :destroy
    has_many :images
    has_many :favorites, dependent: :destroy
    
    def owner?(signed_user)
       user == signed_user 
    end
    
    def has_auction?
        auction.present?
    end

end
