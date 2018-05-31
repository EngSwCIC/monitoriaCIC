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

Dado /^(?:|que eu )estou na (.+)$/ do |page_name|
  visit path_to(page_name)
end

Quando /^(?:|eu )aperto em "([^"]*)"$/ do |button|
  click_button(button)
end

Quando /^(?:|eu )clico em "([^"]*)"$/ do |link|
  click_link(link)
end

Quando /^(?:|eu )preencho "([^"]*)" com "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Quando /^(?:|eu )preencho o formulário de cadastro com informações válidas:$/ do |table|
  table.rows_hash.each {|field, value| fill_in field, :with => value}
end

Quando /^(?:|eu )preencho o formulário de cadastro com o campo "([^"]*)" inválido:$/ do |string|
  case string
  when "Nome"
    steps %(Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            |                           |
        | Matrícula       | 140080279                 |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Email"
    steps %(Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       | 140080279                 |
        | Email           |                           |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Matrícula"
    steps %(Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       |                           |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "CPF"
    steps %(Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       | 140080279                 |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             |                           |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "RG"
    steps %(Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       | 140080279                 |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              |                           |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Senha"
    steps %(Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       |                           |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
    )
  when "Confimar Senha"
    steps %(Quando eu preencho o formulário de cadastro com informações válidas:
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