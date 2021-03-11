Rails.application.routes.draw do

   devise_for :users
   resources :users, only: [:show, :edit, :update]
   resources :engines

   # link tags to engines with the respective tag
   get 'tags/:tag', to: 'engines#index', as: :tag

   root to: 'home#index'
   
end
