Dado('que o aluno preencheu o formulario de monitoria, e que neste consta seu histórico') do
  %{o aluno preenche o formulario e fornece seu historico}
end

Quando('o IRA que consta em meu historico é maior ou igual a {float}') do |float|
  float >= 3.5
end

Quando('meu IRA que consta em meu historico é inferior a {float}') do |float|
  float < 3.5
end

Então('a minha aplicação de monitoria tem o IRA válido') do
  %{a função de validação seta a flag do IRA em 1 (válido)}
  flag_ira = 1
end
Quando('a matricula extraida do meu historico tem o formato válido') do
  %{a função de validação seta a flag da matrícula em 1 (válida)}
end

Quando('a matricula extraida do meu historico tem o formato inválido') do
  %{a função de validação seta a flag da matrícula em 0 (inválida)}
end

Então('a minha aplicação de monitoria é recusada') do
  %{a função de scraping retorna o resultado 'recusado', pois não foi possível identificar o aluno}
end

Quando('o status que consta no histórico é {string}') do |string|
  string = 'ATIVO'
end

Então('a minha aplicação de monitoria tem o status válido') do
  %{flag des status vale 1}
  flag_historico = 1
end

Quando('o status que consta no histórico é diferente de {string}') do |string|
  string != 'ATIVO'
end

Quando('a mencao extraida do histórico ou superior a MS') do
  %{a funcao reconhece que a mencao é MS ou SS}
end

Então('a minha aplicação de monitoria tem a mencao válida') do
  %{flag da mencao vale 1}
  flag_mencao = 1
end

Quando('a mencao extraída do histórico é inferior a MS') do
  %{a funcao reconhece que a mencao difere de SS e MS}
end