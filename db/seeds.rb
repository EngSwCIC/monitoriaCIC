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

Admin.create(id: 1, name: "Admin UnB", email: "secretaria@cic.unb.br",
 password_digest: "$2a$10$wRBUJnS6OyMsIbL2DcuESenrfzGXeKf86Jm7bkdHPaa2gFYDCxt0.",
 remember_token: nil, created_at: '2018-06-04 18:12:09.050792', updated_at: '2018-06-04 18:12:09.050792')

User.create([{id: 1, name: "Bernardo Costa", email: "bernardo1104@gmail.com",
             password_digest: "$2a$10$yzqRBMSJr16fqSo9l218UODeVC3hJtKj7rnKFYGyMmGuZbeunYH2K",
                cpf: "03638481182", rg: "2645178", matricula: "140080279",
                fk_banco: nil, remember_token: nil, created_at: '2018-06-04 19:02:24.831795',
                updated_at: '2018-06-04 19:02:24.831795'}])

#Professor.create(id: 1, name: "Genaina Nunes Rodrigues", email: "genaina@cic.unb.br", username: "grodrigues",
#                     password_digest: "$2a$10$XLKO9PYuuZHGV7BoKQOZbeZdDyA07ebIBiDHwSzoYe.ZkueJE0O3e",
#                     role: 4, remember_token: nil, created_at: "2018-06-04 19:04:20.528451",
#                     updated_at: "2018-06-04 19:04:20.528451")
