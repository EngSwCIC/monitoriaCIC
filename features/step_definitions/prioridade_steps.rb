Dado /^(?:|que )o banco possui uma turma cadastrada com apenas um professor$/ do
  Turma.destroy_all
  Turma.create!(
    id: 1,
    turma: 'A',
    professor: 'Genaina Nunes Rodrigues',
    fk_cod_disciplina: 1,
    fk_status_turma_id: 3,
    qnt_bolsas: 4,
    fk_vagas_id: 1
  )
end

Dado /^(?:|que )o banco possui uma turma cadastrada com dois professores$/ do
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
  Monitoria.find(1).update!(prioridade: 1, prioridade_auxiliar: 2)
end


Dado /^(?:|que )o professor deu uma preferência para o monitor$/ do
  Monitoria.find(1).update!(prioridade: 1, prioridade_auxiliar: nil)
end

Quando /^(?:|eu )sento o dedo emm "([^"]*)"$/ do |link|
  visit("/dashboard/monitorias")
end

Dado /^(?:|que) o professor está na página de monitores da turma$/ do
  steps %(
    Então eu devo estar na página de dashboard do usuário
    Quando eu clico em "Monitoria"
    Então eu devo estar na página de monitoria
  )
end