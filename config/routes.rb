Rails.application.routes.draw do

   # Routes for users
   devise_for :users
   resources :users, only: [:show, :edit, :update]

   # Routes for engines
   resources :engines

   # link tags to engines with the respective tag
   get 'tags/:tag', to: 'engines#index', as: :tag
   get 'rooms/:room', to: 'engines#index', as: :room
   
   # Tags /index /create /new /destroy
   get 'tags', to: 'tags#index'
   post 'tags', to: 'tags#create'
   get 'tag/new', to: 'tags#new'
   get 'tag/:id/edit', to: 'tags#edit', as: :edit_tag
   patch 'tags/:id', to: 'tags#update'
   delete 'tags/:id', to: 'tags#destroy'

   # Routes for Rooms
   #resources :rooms
   get 'rooms', to: 'rooms#index'
   post 'rooms', to: 'romms#create'
   get 'room/new', to: 'rooms#new'
   delete 'rooms/:id', to: 'rooms#destroy'

   # About pages
   get 'about', to: 'about#index'
   get 'about/founders', to: 'about#founders'

   # Settings pages
   get 'settings', to: 'settings#index'

   # Tableau de bord path
   get 'board', to: 'board#index'

   # Home root
   root to: 'home#index'
   
end
