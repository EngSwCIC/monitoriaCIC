Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users
  resources :professors
  resources :sessions
  resources :admins
  resources :dados_bancarios

  match "/dashboard", to: "dashboard#index", via: 'get'
  match "/dashboard/edit_user", to: "dashboard#edit_user", via: 'get'
  match "dashboard/dados_bancarios", to: "dashboard#dados_bancarios", via: 'get'
  match "/faq", to: "faq#index", :via => 'get'
  match "/sobre", to: "sobre#index", :via => 'get'
end
