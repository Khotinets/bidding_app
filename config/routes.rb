Rails.application.routes.draw do
  
  resources :images
  resources :favorites
  resources :auctions
  resources :products
  resources :categories
  
  devise_for :admins, path: 'admins', controllers: { registrations: "admins/registrations", sessions: "admins/sessions", passwords: "admins/passwords", unlocks: "admins/unlocks", confirmations: "admins/confirmations" }
  devise_for :users, path: 'users', controllers: { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", unlocks: "users/unlocks", confirmations: "user/confirmations" }
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'
   resources :profiles
  end
  
  devise_scope :admin do  
   get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  
  match 'fav', to: 'favorites#favorite', via: :post
  match 'unfavorite', to: 'favorites#unfavorite', via: :delete
  
  root 'static_pages#index'
 
end
