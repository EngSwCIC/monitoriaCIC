FactoryBot.define do
    factory :atendimento do
      id {1}
      motivo {FactoryBot.create(:motivo, id: 1)}
      monitor_id {1}
      dia {'2018-10-11'}
      aluno_atendido {'Pablo'}
      descricao {'explicacao_atendimento'}
      
    end
  end