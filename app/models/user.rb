class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :profile, dependent: :destroy
#  after_create :init_profile
  accepts_nested_attributes_for :profile
  
 # def init_profile
#    self.build_profile.save(validate: false)
 # end
  
end