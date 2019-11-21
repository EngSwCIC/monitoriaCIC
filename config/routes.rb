Rails.application.routes.draw do
  resources :atividades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users
  resources :professors
  resources :sessions
  resources :admins
  resources :dados_bancarios
  resources :disciplinas
  resources :turmas
  resources :monitorias do
    collection do
      get 'new_from_disciplina'
    end
  end
  resources :reset_senhas, only: [:new, :create, :edit, :update]

  match "/dashboard", to: "dashboard#index", via: 'get'
  match "/dashboard/edit_user", to: "dashboard#edit_user", via: 'get'
  match "/dashboard/dados_bancarios", to: "dashboard#dados_bancarios", via: 'get'
  match "/dashboard/turmas", to: "dashboard#turmas", via: 'get'
  match "/dashboard/monitorias", to: "dashboard#monitorias", via: 'get'
  match "/dashboard/historico", to: "dashboard#historico", via: 'get'
  match "/dashboard/disciplinas", to: "dashboard#disciplinas", via: 'get'
  match "/dashboard/monitorias/candidatos", to: "monitorias#show", via: 'get'
  match "/dashboard/apagar_alunos", to: "dashboard#apagar_alunos", via: 'get'
  match "/dashboard/deletar_aluno", to: "dashboard#deletar_aluno", via: 'post'
  match "/dashboard/importar_disciplinas", to: "dashboard#importar_disciplinas", via: 'get'
  match "/dashboard/raspar_disciplinas", to: "dashboard#raspar_disciplinas", via: 'get'
  match "/dashboard/importar_professores", to: "dashboard#importar_professores", via: 'get'
  match "/dashboard/scrape_professores", to: "dashboard#scrape_professores", via: 'get'
  match "/dashboard/registrar_atividade", to: "dashboard#registrar_atividade", via: 'get'
  match "/faq", to: "faq#index", :via => 'get'
  match "/sobre", to: "sobre#index", :via => 'get'
  match "/professors/confirm", to: "professors#identityconfirmation", :via => 'post', as: 'confirmation'

end
