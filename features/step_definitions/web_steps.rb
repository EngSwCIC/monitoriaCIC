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

Dado /^(?:|que )o aluno possui uma atividade registrada$/ do
  @ativ = {
    titulo: 'Titulo antes da edicao',
    mensagem: 'mensagem antes da edicao',
    data: '2019-12-25',
    matricula_monitor: '140080279'
  }
  Atividade.create!(@ativ)
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

Dado /^(?:|que )o banco possui uma monitoria$/ do
  Monitoria.create!(
    id: 1,
    remuneracao: 'Remunerado',
    fk_matricula: '140080279',
    fk_cod_disciplina: 1,
    fk_turmas_id: 1,
    descricao_status: "Nota: SS. IRA: 3",
    prioridade: 1,
    fk_status_monitoria_id: 1
  )
end

Dado /^(?:|que )o banco possui duas monitorias$/ do
  Monitoria.create!(
    id: 1,
    remuneracao: 'Remunerado',
    fk_matricula: '140080279',
    fk_cod_disciplina: 1,
    fk_turmas_id: 1,
    descricao_status: "Nota: SS. IRA: 3",
    prioridade: 1,
    fk_status_monitoria_id: 3
  )

  Monitoria.create!(
    id: 2,
    remuneracao: 'Remunerado',
    fk_matricula: '140080299',
    fk_cod_disciplina: 1,
    fk_turmas_id: 1,
    descricao_status: "Nota: SS. IRA: 3",
    prioridade: 1,
    fk_status_monitoria_id: 1
  )
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

Dado /^(?:|que )o banco possui uma disciplina$/ do
  Disciplina.create!(
    :id => 1,
    :cod_disciplina => 1,
    :nome => "Engenharia de Software",
    :fk_tipo_disciplina_id => 1,
    :c_prat => 4,
    :c_teor => 2,
    :c_est => 4,
    :c_ext => 0,
    :monitoria => true)
end

Dado /^(?:|que )o banco possui uma disciplina que nao permite monitoria$/ do
  Disciplina.create!(
    :id => 1,
    :cod_disciplina => 1,
    :nome => "Software Básico",
    :fk_tipo_disciplina_id => 1,
    :c_prat => 2,
    :c_teor => 2,
    :c_est => 0,
    :c_ext => 0,
    :monitoria => "false")
end

Dado /^(?:|que )o banco possui uma turma cadastrada$/ do
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

Dado /^(?:|que )o banco possui uma tarefa$/ do
  Tarefa.create!(
    id: 1,
    titulo: 'Corrigir tarefas de alunos',
    descricao: 'Corrigir, dar notas e enviar no moodle as avaliações e feedbacks da tarefa 1, realizada ontem.',
    inicio: "2019-12-05 12:13:00",
    fim: "2019-12-05 12:14:00",
    monitoria_id: 1
  )
end

Dado /^(?:|que )o banco possui duas turmas cadastradas$/ do
  Turma.create!(
      id: 1,
      turma: 'A',
      professor: 'Genaina Nunes Rodrigues',
      fk_cod_disciplina: 1,
      fk_status_turma_id: 3,
      qnt_bolsas: 4,
      fk_vagas_id: 1
  )

  Turma.create!(
      id: 2,
      turma: 'B',
      professor: 'Genaina Nunes Rodrigues',
      fk_cod_disciplina: 1,
      fk_status_turma_id: 3,
      qnt_bolsas: 4,
      fk_vagas_id: 1
  )
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
  when "admin"
    steps %(
      Quando eu preencho o formulário de login com:
        | user_email    | secretaria@cic.unb.br |
        | user_password | 110492                |
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

Dado /^(?:|que) está na página de dashboard do usuário$/ do
  steps %(
    Então eu devo estar na página de dashboard do usuário
  )
end


Quando /^(?:|eu )aperto em "([^"]*)"$/ do |button|
  click_button(button)
end

Quando /^(?:|eu )clico em "([^"]*)"$/ do |link|
  click_link(link)
end

Quando /^(?:|eu )clico em "([^"]*)" da primeira turma$/ do |link|
  click_link(link)
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

Quando /^(?:|eu )aperto enter no teclado$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.click('Ok')
end

Quando /^(?:|eu )marco a checkbox de "([^"]*)"$/ do |label|
  find('//*[@id="checkbox"]').click
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

Então /^(?:|eu )devo ver todas as mensagens de falha para registro de professores$/ do
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

# Então /^o link "([^"]*)" não deve existir$/ do
#   # TODO: implementar esse step
# end

Então /^(?:|eu )devo ver todas as mensagens de falha para registro de alunos$/ do
  steps %(
    E eu devo ver "Password can't be blank"
    E eu devo ver "Password must be between 6 and 12 characters"
    E eu devo ver "Name can't be blank"
    E eu devo ver "Name is too short (minimum is 3 characters)"
    E eu devo ver "Email can't be blank"
    E eu devo ver "Email invalid email format"
    E eu devo ver "Cpf can't be blank"
    E eu devo ver "Cpf is the wrong length (should be 11 characters)"
    E eu devo ver "Cpf only numbers"
    E eu devo ver "Rg can't be blank"
    E eu devo ver "Rg is too short (minimum is 7 characters)"
    E eu devo ver "Rg only numbers"
    E eu devo ver "Matricula can't be blank"
    E eu devo ver "Matricula is the wrong length (should be 9 characters)"
    E eu devo ver "Matricula only numbers"
    E eu devo ver "Password confirmation must be between 6 and 12 characters"
  )
end
#"
Dado("que meu nome esta na lista") do
  Professor.create!(
    id: 1,
    name: 'Genaina Nunes Rodrigues',
    username: 'grodrigues',
    email: 'genaina@unb.br',
    role: 2,
    password: '123456',
    password_confirmation: '123456'
   )
end

Quando /^(?:|eu )selecionar o "([^"]*)" do seletor "([^"]*)"$/ do |value, field|
  select(value, :from => field)
  @value = value
end

Então("o usuario deve receber um email de confirmação") do
  # make your delivery state to 'test' mode
  ActionMailer::Base.delivery_method = :test
  # make sure that actionMailer perform an email delivery
  ActionMailer::Base.perform_deliveries = true
  # clear all the email deliveries, so we can easily checking the new ones
  ActionMailer::Base.deliveries.clear
  
  @professor = Professor.where(:name => @value)[0]
  ProfessorMailer.with(professor: @professor).key_email.deliver_now

  email = ActionMailer::Base.deliveries.first
  email.from.should.to_s == "notifications@example.com"
  email.to.should.to_s == @professor.email
  email.html_part.body.should include("Para acessar a pagina de login por favor use esse <a href=\"http://localhost:3000/sessions/new\">link</a>.")
end

Então("o usuario não deve receber um email de confirmação") do
  # make your delivery state to 'test' mode
  ActionMailer::Base.delivery_method = :test
  # make sure that actionMailer perform an email delivery
  ActionMailer::Base.perform_deliveries = true
  # clear all the email deliveries, so we can easily checking the new ones
  ActionMailer::Base.deliveries.clear
  
  @professor = " "
  
  email = ActionMailer::Base.deliveries.first
  email.should == nil
end

