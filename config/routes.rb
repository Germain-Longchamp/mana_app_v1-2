Rails.application.routes.draw do

   devise_for :users
   resources :users, only: [:show, :edit, :update]
   resources :engines


   # link tags to engines with the respective tag
   get 'tags/:tag', to: 'engines#index', as: :tag
   get 'tags', to: 'tags#index'

   get 'cars/new', to: 'cars#new'
   post 'cars', to: 'cars#create'
   delete 'tags/:id', to: 'tags#destroy'

   root to: 'home#index'
   
end
