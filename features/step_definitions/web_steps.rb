require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Dado /^(?:|que )o banco possui um adminstrador$/ do
  @adm = {
    name: 'Admin MonitoriaCiC',
    email: 'secretaria@cic.unb.br',
    password: '110492',
    password_confirmation: '110492'
  }
  Admin.create!(@adm)
end

Dado /^(?:|que )o banco possui um aluno e um professor$/ do
  @aluno = {
    id: 1,
    name: 'Bernardo Costa Nascimento',
    email: 'bernardoc1104@gmail.com',
    matricula: '140080279',
    cpf: '03638481182',
    rg: '2645178',
    password: '110492',
    password_confirmation: '110492'
  }

  @professor = {
    id: 1,
    name: 'Genaina Nunes Rodrigues',
    username: 'grodrigues',
    email: 'genaina@unb.br',
    role: 2,
    password: '123456',
    password_confirmation: '123456'
  }

  User.create!(@aluno)
  Professor.create!(@professor)
end

Dado /^(?:|que eu )possuo dados bancários cadastrados$/ do
  @dados_bancarios = {
    codigo: 'Banco do Brasil',
    agencia: '33804',
    conta_corrente: '394653'
  }

  DadosBancarios.create!(@dados_bancarios)
  @user = User.find_by_email('bernardoc1104@gmail.com')
  @dados_bancarios = DadosBancarios.find_by(
    codigo: 'Banco do Brasil',
    agencia: '33804',
    conta_corrente: '394653'
  )
  @user.update!(fk_banco: @dados_bancarios.id)
end

Dado /^(?:|que ) o banco possui uma disciplina$/ do
  Disciplina.create!(
    :cod_disciplina => 1,
    :nome => "Engenharia de Software",
    :fk_tipo_disciplina_id => 1,
    :c_prat => 4,
    :c_teor => 2,
    :c_est => 4,
    :c_ext => 0)
end

Dado /^(?:|que eu )estou na (.+)$/ do |page_name|
  visit path_to(page_name)
end

Dado /^(?:|que o )"([^"]*)" está logado$/ do |user_type|
  case user_type
  when "aluno"
    steps %(
      Quando eu preencho o formulário de login com:
        | user_email    | bernardoc1104@gmail.com |
        | user_password | 110492                  |
      E eu aperto em "Login"
    )
  when "professor"
    steps %(
      Quando eu preencho o formulário de login com:
        | user_email    | genaina@unb.br |
        | user_password | 123456         |
      E eu aperto em "Login"
    )
  end
end

Dado /^(?:|que) está na página de editar perfil$/ do
  steps %(
    Então eu devo estar na página de dashboard do usuário
    Quando eu clico em "Editar Perfil"
    Então eu devo estar na página de editar perfil do usuário
  )
end

Dado /^(?:|que) está na página de disciplinas$/ do
  steps %(
    Então eu devo estar na página de dashboard do usuário
    Quando eu clico em "Disciplinas"
    Então eu devo estar na página de disciplinas
  )
end

Quando /^(?:|eu )aperto em "([^"]*)"$/ do |button|
  click_button(button)
end

Quando /^(?:|eu )clico em "([^"]*)"$/ do |link|
  click_link(link)
end

Quando /^(?:|eu )clico no link "([^"]*)"$/ do |link|
  first('.editar-dados').click_link(link)
end

Quando /^(?:|eu )preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Quando /^(?:|eu )escolho o "([^"]*)" do seletor "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

Quando /^(?:|eu )preencho o formulário de login com:$/ do |table|
  table.rows_hash.each {|field, value| fill_in field, :with => value}
end

Quando /^(?:|eu )preencho o formulário com:$/ do |table|
  table.rows_hash.each {|field, value| fill_in field, :with => value}
end

Quando /^(?:|eu )preencho o formulário de cadastro com o campo "([^"]*)" inválido:$/ do |string|
  case string
  when "Nome"
    steps %(Quando eu preencho o formulário com:
        | Nome            |                           |
        | Matrícula       | 140080279                 |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Email"
    steps %(Quando eu preencho o formulário com:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       | 140080279                 |
        | Email           |                           |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Matrícula"
    steps %(Quando eu preencho o formulário com:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       |                           |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "CPF"
    steps %(Quando eu preencho o formulário com:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       | 140080279                 |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             |                           |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "RG"
    steps %(Quando eu preencho o formulário com:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       | 140080279                 |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              |                           |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Senha"
    steps %(Quando eu preencho o formulário com:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       |                           |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Confimar Senha"
    steps %(Quando eu preencho o formulário com:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       |                           |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha |                           |
    )
  end
end

Então /^(?:|eu )devo estar na (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Então /^(?:|eu )devo ver "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Então /^(?:|eu )não devo ver "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Então /^(?:|eu )devo ver as todas as mensagens de falha para registro de professores$/ do
  steps %(
    E eu devo ver "Password can't be blank"
    E eu devo ver "Password must be between 6 and 12 characters"
    E eu devo ver "Name can't be blank"
    E eu devo ver "Name is too short (minimum is 3 characters)"
    E eu devo ver "Username can't be blank"
    E eu devo ver "Username is too short (minimum is 3 characters)"
    E eu devo ver "Username only word characters (letter, numbers, underscore...)"
    E eu devo ver "Email can't be blank"
    E eu devo ver "Email not a UnB email"
    E eu devo ver "Password confirmation must be between 6 and 12 characters"
  )
end