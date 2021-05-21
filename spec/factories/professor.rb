FactoryBot.define do
  factory :professor do
    name {'Genaina'}
    username {'grodrigues'}
    email {'genainaCic@unb.br'}
    role {4}
    password {'110492'}
    password_confirmation {'110492'}
  end
end