class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :product
    
    #user can favorite product only once
    validates :user_id, uniqueness: { scope: :product_id }

end
