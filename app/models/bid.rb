class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :auction
    validates_presence_of :quantity, :numericality => {:greater_than => 0}
    
    def owner?(signed_user)
       user == signed_user 
    end
end
