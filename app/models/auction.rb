class Auction < ApplicationRecord
    belongs_to :product
    belongs_to :user
    has_many :bids
    validates_uniqueness_of :product_id
    validates_presence_of :starts_at, :ends_at
    
    # Check if auction is in progress
    def active?
        starts_at < Time.now && Time.now < ends_at
    end
    
    def started?
       starts_at < Time.now 
    end
    
    def finished?
       ends_at < Time.now
    end
    
    def time_left_to_start
       starts_at - Time.now
    end
    
    def time_left_to_end
       ends_at - Time.now
    end
end
