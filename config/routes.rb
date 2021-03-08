Rails.application.routes.draw do

   get 'users/index'
   get 'users/show'
   get 'users/new'
   get 'users/edit'
   get 'users/create'
   get 'users/update'
   get 'users/destroy'
   devise_for :users
   resources :engines
   root to: 'home#index'
   
end
