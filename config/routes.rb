Rails.application.routes.draw do
  resources :engines
     root to: 'home#index'
end
