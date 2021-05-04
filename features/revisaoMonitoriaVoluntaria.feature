#language: pt
Funcionalidade: Como administrador consigo revisar as alocacoes de vagas de monitoria voluntaria.

Cenario de Fundo:
  Dado que o banco possui uma disciplina
  E que o banco possui um adminstrador
  E que o banco possui um aluno e um professor
  E que o banco possui uma turma cadastrada
  E que o banco possui uma monitoria voluntaria
  E que eu estou na página de login de usuários
  E que o "admin" está logado

Cenario: Eu enquanto administrador, quero revisar as vagas de monitoria voluntaria e chego na pagina desejada. (Happy path)
  Dado que o banco possui uma monitoria
  Quando eu clico em "Revisar vagas de monitoria"
  Entao eu devo estar na pagina de revisão de monitorias
  E eu devo ver "Remuneração: Voluntária"
  E eu devo ver "Remuneração: Remunerada"
  E eu devo ver "Aluno: Bernardo Costa Nascimento"
  E o seletor "put_2" deve ter o valor "Aceito"
  Quando eu escolho o "Voluntária" do seletor "get_remuneracao"
  E eu aperto em "Filtrar"
  Entao eu não devo ver "Remuneração: Remunerada"
  Quando eu escolho o "Recusado" do seletor "put_2"
  E eu aperto em "Atualizar"
  Entao eu devo estar na pagina de revisão de monitorias
  Entao o seletor "put_2" deve ter o valor "Recusado"

Cenario: Eu enquanto administrador nao posso revisar se nao houverem monitorias
  Quando eu clico em "Revisar vagas de monitoria"
  Entao eu devo estar na pagina de revisão de monitorias
  E eu devo ver "Aluno: Bernardo Costa Nascimento"
  E o seletor "put_2" deve ter o valor "Aceito"
  Quando eu escolho o "Remunerada" do seletor "get_remuneracao"
  E eu aperto em "Filtrar"
  Entao eu não devo ver "Aluno: "

