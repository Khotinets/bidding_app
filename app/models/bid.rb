class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :product
    belongs_to :auction
    validates_presence_of :quantity
    
    def owner?(signed_user)
       user == signed_user 
    end
end
