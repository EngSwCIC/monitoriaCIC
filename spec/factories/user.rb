FactoryBot.define do
  factory :user do
    id 'A fake ID' # Default values
    name 'Bernardo Costa'
    matricula '140080279'
    email 'bernardoc1104@gmail.com'
    cpf '03638481182'
    rg '2645178'
    password '110492'
    password_confirmation '110492'
    fk_banco nil
    remember_token nil
    created_at { 5.days.ago }
    updated_at { 5.days.ago }
  end
end