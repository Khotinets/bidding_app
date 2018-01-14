class Product < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_one :auction, dependent: :destroy
end
