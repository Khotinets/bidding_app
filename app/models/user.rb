class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  
  has_many :products, dependent: :destroy
  has_many :favorites
  has_many :auctions
  has_many :images
  has_many :bids
  
  def favorite!(product)
    self.favorites.create(product_id: product.id)
  end
  
  def unfavorite!(product)
    favorite = self.favorites.find_by_product_id(product.id)
    favorite.destroy!
  end
  
  def favorite?(product)
    self.favorites.find_by_product_id(product.id)
  end
  
end
