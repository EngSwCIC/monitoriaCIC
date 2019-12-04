FactoryBot.define do
  factory :turma do
    id {1}
    turma {'A'}
    professor {'Genaina Nunes Rodrigues'}
    fk_cod_disciplina {113468}
    fk_status_turma_id {3}
    qnt_bolsas {4}
    fk_vagas_id {1}
  end
end