Rails.application.routes.draw do
  
  namespace :user do
   resources :products
  end
 
  resources :products do
   collection do
    match 'auction_all', to: 'products#auction_all', via: :get
    match 'without_auction', to: 'products#without_auction', via: :get
   end
   resource :favorite  do
    member do
     match 'fav', to: 'favorites#favorite', via: :post
     match 'unfavorite', to: 'favorites#unfavorite', via: :delete
    end
   end
  end
  
  match 'clear_favorites', to: 'favorites#clear_favorites', via: :get
  
  resources :images
  resources :favorites
  resources :auctions
  resources :categories
  resources :bids
  
  devise_for :admins, path: 'admins', controllers: { registrations: "admins/registrations", sessions: "admins/sessions", passwords: "admins/passwords", unlocks: "admins/unlocks", confirmations: "admins/confirmations" }
  devise_for :users, path: 'users', controllers: { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", unlocks: "users/unlocks", confirmations: "user/confirmations" }
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'
   resources :profiles
  end
  
  devise_scope :admin do  
   get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  root 'static_pages#index'
  
  mount ActionCable.server, at: '/cable'
  
end
