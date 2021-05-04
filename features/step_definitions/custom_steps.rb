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
        disciplina = Disciplina.new valores
        if disciplina.save
            d = Disciplina.find_by(valores)
            log(d.id)
        else
            log("naum funfa")
		end
        # Disciplina.create!(valores)
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

Quando('eu clico em {string} dentro de {string}') do |link, parent|
    with_scope(parent) { click_link(link) }
end