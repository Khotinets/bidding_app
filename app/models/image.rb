class Image < ApplicationRecord
    mount_uploader :image_url, ImageUploader
    belongs_to :product
    belongs_to :user
    validates_presence_of :image_url
    
    def owner?(signed_user)
       user == signed_user 
    end
    
end
