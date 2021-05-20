# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.destroy_all
Professor.destroy_all
User.destroy_all
Turma.destroy_all
Disciplina.destroy_all
Monitoria.destroy_all

######################
Admin.create(id: 1, name: "Admin UnB", email: "secretaria@cic.unb.br", password: "123456",
    remember_token: nil, created_at: '2018-06-04 18:12:09.050792', updated_at: '2018-06-04 18:12:09.050792')

######################
Disciplina.create!([{id:1, nome: "APC", 
                    fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 4, 
                    cod_disciplina: 1}])


Disciplina.create!([{id:2, nome: "ED", 
                    fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 2, 
                    cod_disciplina: 2}])
######################


User.create!(id: 1, name: "Aluno", email: "aluno1@gmail.com", password: "123456", password_confirmation: '123456',
                cpf: "03638481182", rg: "2645178", matricula: "140080279")

User.create!(id: 2, name: "Aluno A", email: "aluno2@gmail.com", password: "123456", password_confirmation: '123456',
                cpf: "58385203028", rg: "2435178", matricula: "150060279")

User.create!(id: 3, name: "Aluno B", email: "aluno3@gmail.com", password: "123456", password_confirmation: '123456',
                cpf: "19215272003", rg: "5245378", matricula: "160088333")

User.create!(id: 4, name: "Aluno C", email: "aluno4@gmail.com", password: "123456", password_confirmation: '123456',
                cpf: "26389963009", rg: "3345179", matricula: "130099979")

User.create!(id: 5, name: "Aluno D", email: "aluno5@gmail.com", password: "123456", password_confirmation: '123456',
                cpf: "80906055083", rg: "6205279", matricula: "180080279")

######################
Monitoria.create!(id: 1, remuneracao: 'Remunerado', fk_matricula: '140080279' , fk_cod_disciplina: 1, fk_turmas_id: 1, prioridade: 1,
                    fk_status_monitoria_id: 1);

Monitoria.create!(id: 2, remuneracao: 'Remunerado', fk_matricula: '150060279' , fk_cod_disciplina: 1, fk_turmas_id: 2, prioridade: 1,
                    fk_status_monitoria_id: 1);

Monitoria.create!(id: 3, remuneracao: 'Remunerado',fk_matricula: '160088333' , fk_cod_disciplina: 1, fk_turmas_id: 1, prioridade: 1,
                    fk_status_monitoria_id: 1);

Monitoria.create!(id: 4, remuneracao: 'Remunerado',fk_matricula: '130099979', fk_cod_disciplina: 2, fk_turmas_id: 4, prioridade: 1,
                    fk_status_monitoria_id: 1);
        
Monitoria.create!(id: 5, remuneracao: 'Remunerado',fk_matricula: '180080279', fk_cod_disciplina: 1, fk_turmas_id: 4, prioridade: 1,
                    fk_status_monitoria_id: 1);
######################
                    
# User.create(id: 2, name: "Aluno2", email: "aluno2@gmail.com", password: "123456",
#                 cpf: "03638481111", rg: "2645111", matricula: "140080211",
#                 fk_banco: nil, remember_token: nil, created_at: '2018-06-04 19:02:24.831795',
#                 updated_at: '2018-06-04 19:02:24.831795')

Professor.create!(id: 1, name: "Genaina", email: "genaina@unb.br", username: "genaina", password: "123456", password_confirmation: '123456', role: 1)
Professor.create!(id: 2, name: "Carla", email: "carla@unb.br", username: "carla", password: "123456", password_confirmation: '123456', role: 1)
######################

######################
Turma.create!(id:1, turma: "A", professor: "Carla", fk_cod_disciplina: 1 , qnt_bolsas: 1, fk_vagas_id: 1)
Turma.create!(id:2, turma: "B", professor: "Genaina", fk_cod_disciplina: 1, qnt_bolsas: 1, fk_vagas_id: 1)
Turma.create!(id:3, turma: "C", professor: "Genaina", fk_cod_disciplina: 2, qnt_bolsas: 1, fk_vagas_id: 1)
Turma.create!(id:4, turma: "D", professor: "Carla", fk_cod_disciplina: 2, qnt_bolsas: 4, fk_vagas_id: 1)
######################

