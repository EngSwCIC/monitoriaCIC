FactoryBot.define do
    factory :atendimento do
      id {1}
      motivo {'1'}
      dia {'2018-10-11'}
      aluno_atendido {'Pablo'}
      descricao {'explicacao_atendimento'}
      
    end
  end