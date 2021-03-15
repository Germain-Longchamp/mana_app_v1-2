Rails.application.routes.draw do

   # Routes for users
   devise_for :users
   resources :users, only: [:show, :edit, :update]

   # Routes for engines
   resources :engines

   # link tags to engines with the respective tag
   get 'tags/:tag', to: 'engines#index', as: :tag
   
   # Tags /index /create /new /destroy
   get 'tags', to: 'tags#index'
   post 'tags', to: 'tags#create'
   get 'tag/new', to: 'tags#new'
   get 'tag/:id/edit', to: 'tags#edit', as: :edit_tag
   patch 'tags/:id', to: 'tags#update'
   delete 'tags/:id', to: 'tags#destroy'

   # About pages
   get 'about', to: 'about#index'
   get 'about/founders', to: 'about#founders'

   # Settings pages
   get 'settings', to: 'settings#index'

   # Home root
   root to: 'home#index'
   
end
