Dado('que o banco possui varias disciplinas.') do
  @disciplina = Disciplina.find_by_id(1)
end

Dado('que o banco possui varias turmas.') do
  @turma = Turma.find_by_id(1)
end

Dado('que o banco possui alunos e professores.') do
  @user = User.find_by_id(1)
  @prof1 = Professor.find_by_id(1)
  @prof2 = Professor.find_by_id(2)
end

Dado('que o banco possui as monitorias processadas por aluno\/turma.') do
  @monitoria = Monitoria.find_by_id(1)
end

Dado('que o nome do professor e da turma estão na lista') do
  @monitoria = Monitoria.find_by_id(1)
  @user = User.find_by_matricula(@monitoria.fk_matricula)
  @turma = Turma.find(@monitoria.fk_turmas_id)
  @professor = Professor.find_by_name(@turma.professor)
end

Dado('que um ou vários alunos foram processados para essa turma') do
  @monitoria = Monitoria.find_by_id(1)
  @user = User.find_by_matricula(@monitoria.fk_matricula)
end

Dado('que estou na página de processamento') do
  check(1+1==3)
end

Quando('eu apertar o botão {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o professor daquela turma receberá um email com as informações da turma e de cada aluno') do
  pending # Write code here that turns the phrase above into concrete actions
end

Dado('que nenhum aluno foi processao para essa turma') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o professor daquela turma receberá um email explicando que não houve candidatos aptos para preencher as vagas de monitoria') do
  pending # Write code here that turns the phrase above into concrete actions
end

