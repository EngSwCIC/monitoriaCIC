Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users
  resources :sessions
  post 'sign_up', to: 'users#create', as: 'sign_up'
end
