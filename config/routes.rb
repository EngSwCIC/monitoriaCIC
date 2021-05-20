Rails.application.routes.draw do
  resources :atendimentos, only: [:new, :create, :edit, :update, :destroy]
  resources :motivos
 # resources :atividades #plural
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  resources :tarefas
  resources :users
  resources :professors
  resources :sessions
  resources :admins
  resources :dados_bancarios
  resources :atividades
  resources :disciplinas
  resources :turmas
  resources :monitorias do
    collection do
      get 'new_from_disciplina'
    end
  end
  resources :monitorias_remunerada
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
  match "/dashboard/vagas_monitoria", to: "dashboard#vagas_monitoria", via: 'get'
  match "/dashboard/monitoria_remunerada", to: "dashboard#monitoria_remunerada", via: 'get'
  match "/dashboard/alocar_bolsa", to: "dashboard#alocar_bolsa", :via => 'get'
  match "/dashboard/monitorias_remunerada/candidatos", to: "monitorias_remunerada#show", via: 'get'
  get 'monitorias_remunerada/edit'
  get 'monitorias_remunerada/show'

  match "/dashboard/atendimentos", to: "dashboard#atendimentos", via: [:get, :post]
  match "/dashboard/registrar_atividade", to: "dashboard#registrar_atividade", via: 'get'

  match "/dashboard/atendimentos", to: "dashboard#atendimentos", via: 'get'

  match "/dashboard/atividades", to: "dashboard#atividades", via: 'get'
  match "/faq", to: "faq#index", :via => 'get'
  match "/sobre", to: "sobre#index", :via => 'get'
  match "/professors/confirm", to: "professors#identityconfirmation", :via => 'post', as: 'confirmation'

end
