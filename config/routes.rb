Rails.application.routes.draw do

   devise_for :users
   resources :users, only: [:show, :edit, :update]
   resources :engines
   root to: 'home#index'
   
end
