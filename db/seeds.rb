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

######################
Admin.create(id: 1, name: "Admin UnB", email: "secretaria@cic.unb.br", password: "123456",
   remember_token: nil, created_at: '2018-06-04 18:12:09.050792', updated_at: '2018-06-04 18:12:09.050792')

######################
Disciplina.create([{nome: "APC", 
                    fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 4, 
                    cod_disciplina: 1, monitoria: true}])


Disciplina.create([{nome: "ED", 
                    fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 2, 
                    cod_disciplina: 2}])
######################

puts "Seed done."
# User.create(id: 1, name: "Aluno1", email: "aluno1@gmail.com", password: "123456",
                # cpf: "03638481182", rg: "2645178", matricula: "140080279")

# User.create(id: 2, name: "Aluno2", email: "aluno2@gmail.com", password: "123456",
#                 cpf: "03638481111", rg: "2645111", matricula: "140080211",
#                 fk_banco: nil, remember_token: nil, created_at: '2018-06-04 19:02:24.831795',
#                 updated_at: '2018-06-04 19:02:24.831795')

#Professor.create(id: 1, name: "Carla", email: "carla@unb.br", username: "carla", password: "123456", role: 1)
######################

######################
# Turma.create([{turma: "A", professor: "Carla", fk_cod_disciplina: 1}])
######################

