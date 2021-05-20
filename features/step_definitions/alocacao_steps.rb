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

Dado /^(?:|que )o banco possui quatro turmas cadastradas$/ do
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

		Turma.create!(
			id: 3,
			turma: 'C',
			professor: 'Genaina Nunes Rodrigues',
			fk_cod_disciplina: 1,
			fk_status_turma_id: 3,
			qnt_bolsas: 4,
			fk_vagas_id: 1
		)

		Turma.create!(
			id: 4,
			turma: 'D',
			professor: 'Genaina Nunes Rodrigues',
			fk_cod_disciplina: 1,
			fk_status_turma_id: 3,
			qnt_bolsas: 4,
			fk_vagas_id: 1
		)
end

Então /^(?:|eu )devo ver "([^"]*)", "([^"]*)", "([^"]*)" e "([^"]*)"$/ do |text, text2, text3, text4|
  if page.respond_to? :should
    page.should have_content(text)
		page.should have_content(text2)
		page.should have_content(text3)
		page.should have_content(text4)
  else
    assert page.has_content?(text)
		assert page.has_content?(text2)
		assert page.has_content?(text3)
		assert page.has_content?(text4)
  end
end

Quando /^(?:|eu )aperto em "([^"]*)" novamente$/ do |button|
  click_button(button)
end


Dado /^(?:|que )o banco possui duas disciplinas$/ do
  Disciplina.create!(
    :id => 1,
    :cod_disciplina => 1,
    :nome => "Algoritmos e Programação de Computadores",
    :fk_tipo_disciplina_id => 1,
    :c_prat => 4,
    :c_teor => 2,
    :c_est => 4,
    :c_ext => 0)

	Disciplina.create!(
    :id => 2,
		:cod_disciplina => 2,
		:nome => "Estrutura de Dados",
		:fk_tipo_disciplina_id => 1,
		:c_prat => 4,
		:c_teor => 2,
		:c_est => 4,
		:c_ext => 0)
end

Dado /^(?:|que )o banco possui monitorias pendentes cadastradas$/ do
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
  
    Monitoria.create!(
      id: 2,
      remuneracao: 'Remunerado',
      fk_matricula: '150060279',
      fk_cod_disciplina: 1,
      fk_turmas_id: 2,
      descricao_status: "Nota: SS. IRA: 3",
      prioridade: 1,
      fk_status_monitoria_id: 1
    )
  
      Monitoria.create!(
      id: 3,
      remuneracao: 'Remunerado',
      fk_matricula: '160088333',
      fk_cod_disciplina: 1,
      fk_turmas_id: 1,
      descricao_status: "Nota: SS. IRA: 3",
      prioridade: 1,
      fk_status_monitoria_id: 1
    )
  
      Monitoria.create!(
      id: 4,
      remuneracao: 'Remunerado',
      fk_matricula: '130099979',
      fk_cod_disciplina: 1,
      fk_turmas_id: 1,
      descricao_status: "Nota: SS. IRA: 3",
      prioridade: 1,
      fk_status_monitoria_id: 1
    )
  
    Monitoria.create!(
      id: 5,
      remuneracao: 'Remunerado',
      fk_matricula: '180080279',
      fk_cod_disciplina: 1,
      fk_turmas_id: 3,
      descricao_status: "Nota: MS. IRA: 4", 
      prioridade: 1,
      fk_status_monitoria_id: 1
    )
end
  
Dado /^(?:|que )o banco possui alunos$/ do
  @aluno = User.create!(
    id: 1,
    name: 'Bernardo Costa Nascimento',
    email: 'bernardoc1104@gmail.com',
    matricula: '180080279',
    cpf: '03638481182',
    rg: '2648778',
    password: '110492',
    password_confirmation: '110492'
  )

  @aluno1 = User.create!(
    id: 2,
    name: 'Jonathan Vinicius',
    email: 'jonathanvin@gmail.com',
    matricula: '130099979',
    cpf: '11121046070',
    rg: '2257783',
    password: '110492',
    password_confirmation: '110492'
  )

  @aluno2 = User.create!(
    id: 3,
    name: 'Claudio Vinicius',
    email: 'claudindopneu@gmail.com',
    matricula: '140080279',
    cpf: '83345924005',
    rg: '4657870',
    password: '110492',
    password_confirmation: '110492'
  )

  @aluno3 = User.create!(
    id: 4,
    name: 'Anderson Souza Nunes',
    email: 'fiukdobbb@gmail.com',
    matricula: '150060279',
    cpf: '95753074022',
    rg: '3456278',
    password: '110492',
    password_confirmation: '110492'
  )

  @aluno4 = User.create!(
    id: 5,
    name: 'Fabio Junior',
    email: 'fabinJunin@gmail.com',
    matricula: '160088333',
    cpf: '69246843002',
    rg: '2649778',
    password: '110492',
    password_confirmation: '110492'
  )
  
end

Então /^(?:|eu )não devo ver os monitores alocados$/ do
  if page.respond_to? :should
    page.should have_no_content("#{@aluno.name}.")
    page.should have_no_content("#{@aluno1.name}.")
    page.should have_no_content("#{@aluno2.name}.")
    page.should have_no_content("#{@aluno3.name}.")
    page.should have_no_content("#{@aluno4.name}.")
  else
    assert page.has_no_content?("#{@aluno.name}.")
    assert page.has_no_content?("#{@aluno1.name}.")
    assert page.has_no_content?("#{@aluno2.name}.")
    assert page.has_no_content?("#{@aluno3.name}.")
    assert page.has_no_content?("#{@aluno4.name}.")
  end
end

Então /^(?:|eu )devo ver os monitores alocados$/ do
  if page.respond_to? :should
    page.should have_content("#{@aluno.name}.")
    page.should have_content("#{@aluno1.name}.")
    page.should have_content("#{@aluno2.name}.")
    page.should have_content("#{@aluno3.name}.")
    page.should have_content("#{@aluno4.name}.")
  else
    assert page.has_content?("#{@aluno.name}.")
    assert page.has_content?("#{@aluno1.name}.")
    assert page.has_content?("#{@aluno2.name}.")
    assert page.has_content?("#{@aluno3.name}.")
    assert page.has_content?("#{@aluno4.name}.")
  end
end

Quando /^(?:|eu )clico em "([^"]*)" na primeira turma$/ do |link_name|
  click_link(link_name, match: :first)
end

Quando /^(?:|eu )clico em "([^"]*)" do monitor$/ do |link_name|
  click_link(link_name, match: :first)
end