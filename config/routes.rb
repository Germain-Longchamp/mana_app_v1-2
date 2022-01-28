Rails.application.routes.draw do
   
  resources :intervention_categories
    # Routes for Interventions
    resources :interventions

    # Routes for Companies
    resources :companies

    # Routes for Users
    devise_for :users, :path => 'account'
    resources :users

    # Routes for Engines
    resources :engines

    # link tags to engines with the respective tag
    get 'tags/:tag', to: 'engines#index', as: :tag
    get 'rooms/:room', to: 'engines#index', as: :room

    # Tags /index /create /new /destroy
    get 'settings/tags', to: 'tags#index'
    post 'tags', to: 'tags#create', defaults: { format: 'js' }
    get 'tag/new', to: 'tags#new'
    get 'tag/:id/edit', to: 'tags#edit', as: :edit_tag
    patch 'tags/:id', to: 'tags#update'
    delete 'tags/:id', to: 'tags#destroy'

    # Routes for Rooms
    get 'settings/rooms', to: 'rooms#index'
    post 'rooms', to: 'rooms#create'
    get 'room/new', to: 'rooms#new'
    get 'room/:id/edit', to: 'rooms#edit', as: :edit_room
    patch 'rooms/:id', to: 'rooms#update'
    delete 'rooms/:id', to: 'rooms#destroy'

    # Routes for Issues
    resources :issues
    get 'issues-archives', to: 'issues#archive'

    # Routes for Issues Types
    resources :types, only: [:create, :destroy, :update, :new, :edit]
    get 'settings/types', to: 'types#index'


    # About pages
    get 'about', to: 'about#index'
    get 'about/founders', to: 'about#founders'

    #MegaAdmin page
    get 'megaadmin051293', to: 'mega_admin#index'

    # Settings pages
    get 'settings', to: 'settings#index'

    # Tableau de bord path
    get 'board', to: 'board#index'

    # Home root
    root to: 'home#index'
   
end
