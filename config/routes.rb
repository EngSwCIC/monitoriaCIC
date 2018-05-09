Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  # Rota para o registro dos alunos
  post '/home/registrar'

  #
  resources :login
  post '/login/user'
end
