Rails.application.routes.draw do
  
  resources :auctions
  resources :products
 devise_for :users, controllers: { registrations: "registrations" }
 devise_scope :user do  
  get '/users/sign_out' => 'devise/sessions#destroy'     
 end

 resources  :profiles
 resources  :categories
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
 root 'static_pages#index'
 
end
