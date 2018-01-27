class Product < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_one :auction, dependent: :destroy
    has_many :images
    has_many :favorites
    has_many :bids
end
