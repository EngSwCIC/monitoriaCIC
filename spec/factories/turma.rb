FactoryBot.define do
  factory :turma do
    id {1}
    turma {'A'}
    professor {'Genaina'}
    fk_cod_disciplina {1}
    fk_status_turma_id {2}
    qnt_bolsas {4}
    fk_vagas_id {1}
  end
end