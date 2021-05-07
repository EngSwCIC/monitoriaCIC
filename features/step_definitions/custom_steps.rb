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

Dado /^(?:|que eu )coloco o arquivo "([^"]*)" em "([^"]*)"$/ do |path, field|
    attach_file(field, File.expand_path(path))
end

Dado('que as seguintes disciplinas existem:') do |table|
    table.hashes.each do |valores|
        valores[:fk_tipo_disciplina_id] = 1
        valores[:c_prat] = 0
        valores[:c_teor] = 0
        valores[:cod_disciplina] = valores[:cod_disciplina].match(/CIC(\d+)/)[1].to_i
        Disciplina.create!(valores)
        # Disciplina.create!([{nome: nome, 
        #     fk_tipo_disciplina_id: 1, c_prat: 0, c_teor: 0, 
        #     cod_disciplina: codigo}])
    end
end

Dado('que os seguintes professores existem:') do |table|
    table.hashes.each do |valores|
        Professor.create!(valores)
    end
end

Dado('que as seguintes turmas existem:') do |table|
    table.hashes.each do |valores|
        Turma.create!(valores)
    end
end

Então('eu devo ver:') do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.raw.each do |elem|
        text = elem[0]
        if page.respond_to? :should
            page.should have_content(text)
        else
            assert page.has_content?(text)
        end
    end
end

Então('eu devo ver os seguintes itens somente uma vez:') do |table|
    table.raw.each do |elem|
        text = elem[0]
        if page.respond_to? :should
            page.should have_content(/^#{text}$/, count: 1)
        else
            assert page.has_content?(/^#{text}$/, count: 1)
        end
    end
end

Quando('eu clico em {string} dentro da seção {string}') do |link, parent|
    within(:xpath, "//div[h5[text()='#{parent}']]") do
        click_link(link)
    end
end