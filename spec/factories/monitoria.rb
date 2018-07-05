FactoryBot.define do
  factory :monitoria do
    id '1'
    remuneracao 'Voluntária'
    fk_matricula '140080384'
    fk_cod_disciplina '1'
    fk_turmas_id '1'
    descricao_status 'Nota: SS, IRA: 3'
    prioridade '1'
    fk_status_monitoria_id '1'
  end
end