FactoryBot.define do
  factory :monitoria do
    remuneracao {'Voluntária'}
    fk_matricula {'140080384'}
    fk_cod_disciplina {'1'}
    fk_turmas_id {'1'}
    descricao_status {'Nota: SS, IRA: 3'}
    prioridade {'1'}
    prioridade_auxiliar {'2'}
    fk_status_monitoria_id {'1'}
  end
end