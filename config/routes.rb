Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users
  resources :professors
  resources :sessions
  resources :admins

  match "/dashboard", to: "dashboard#index", via: 'get'
  match "/faq", to: "faq#index", :via => 'get'
end
