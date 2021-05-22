Dado /^(?:|que )o banco possui uma turma cadastrada com dois professores$/ do
  Disciplina.destroy_all
  Turma.destroy_all
  Disciplina.create!([{id:1, nome: "APC", 
    fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 4, 
    cod_disciplina: 1}])
  Turma.create!(
    id: 1,
    turma: 'A',
    professor: 'Genaina Nunes Rodrigues',
    professor_auxiliar: 'Carla Castanho',
    fk_cod_disciplina: 1,
    fk_status_turma_id: 3,
    qnt_bolsas: 4,
    fk_vagas_id: 1
  )
end

Dado /^(?:|que )dois professores deram uma preferência para o monitor$/ do
  monitoria = Monitoria.find(1).update!(prioridade: 1, prioridade_auxiliar: 2)
  visit "#{current_path}?id=1"
end

Dado /^(?:|que )o professor deu uma preferência para o monitor$/ do
  monitoria = Monitoria.find(1).update!(prioridade: 1, prioridade_auxiliar: nil)
  visit "#{current_path}?id=1"
end

Dado /^(?:|que) o professor está na página de monitores da turma$/ do
  steps %(
    Então eu devo estar na página de dashboard do usuário
    Quando eu clico em "Monitoria"
    Então eu devo estar na página de monitoria
    Quando eu clico em "Ver lista de monitores"
    Então eu devo estar na página de candidatos
  )
end

Dado /^(?:|que) o professor está na página de alterar monitoria$/ do
  steps %(
    Quando eu clico em "Alterar Situaçao"
    Então eu devo estar na página de alterar monitoria 1
  )
end

