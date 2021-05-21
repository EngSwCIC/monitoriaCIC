Dado('que o banco possui varias disciplinas.') do
  Disciplina.create!([{id:1, nome: "APC", 
                    fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 4, 
                    cod_disciplina: 1}])
  
  Disciplina.create!([{id:2, nome: "ED", 
                    fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 2, 
                    cod_disciplina: 2}])
                    
end

Dado('que o banco possui varias turmas.') do
  Turma.create([{id:1, turma: "A", professor: "Carla", fk_cod_disciplina: 1, fk_vagas_id: 1}])
  Turma.create([{id:2, turma: "B", professor: "Chacon", fk_cod_disciplina: 1, fk_vagas_id: 2}])
end

Dado('que o banco possui alunos e professores.') do
  Professor.create!(id: 1, name: "Genaina", email: "genaina@unb.br", username: "genaina", password: "123456", password_confirmation: '123456', role: 1)
  Professor.create!(id: 2, name: "Carla", email: "carla@unb.br", username: "carla", password: "123456", password_confirmation: '123456', role: 1)

  User.create!(id: 1, name: "Aluno", email: "aluno1@gmail.com", password: "123456", password_confirmation: '123456',
  cpf: "03638481182", rg: "2645178", matricula: "140080279")
  User.create!(id: 2, name: "AlunoDois", email: "aluno2@gmail.com", password: "12345678", password_confirmation: '12345678',
  cpf: "15436178081", rg: "2645358", matricula: "140012345")
end

Dado('que o banco possui as monitorias processadas por aluno\/turma.') do
  Monitoria.create!(id: 1, remuneracao: "10", fk_matricula: "140080279", fk_cod_disciplina: 1, fk_turmas_id: 1, descricao_status: "quero muito a monitoria",prioridade: 1,fk_status_monitoria_id: 1)
end

Dado('que o nome do professor e da turma estão na lista') do
  @monitoria = Monitoria.first()
  @turma = Turma.find(@monitoria.fk_turmas_id)
  @professor = Professor.find_by_name(@turma.professor)
end

Dado('que um ou vários alunos foram processados para essa turma') do
  @monitoria = Monitoria.find_by_id(1)
  @user = User.find_by_matricula(@monitoria.fk_matricula)
end

Dado('que estou na página de processamento') do
  visit 'http://localhost:3000/dashboard/monitorias'
end

Quando('eu apertar o botão {string}') do |string|
  visit 'http://localhost:3000/dashboard/monitorias'
end

Então('o professor daquela turma receberá um email com as informações da turma e de cada aluno') do
  MonitoriaMailer.resultado_monitoria_user
  MonitoriaMailer.resultado_monitoria_prof
end

Dado('que nenhum aluno foi processao para essa turma') do
  MonitoriaMailer.resultado_monitoria_prof
end

Então('o professor daquela turma receberá um email explicando que não houve candidatos aptos para preencher as vagas de monitoria') do
  MonitoriaMailer.resultado_monitoria_prof
end

