<<<<<<< HEAD
#language pt
  Funcionalidade: Como administrador consigo revisar as alocacoes de vagas de monitoria voluntaria.

  Cenario de Fundo:
    Dado que o banco possui uma disciplina.
    E que o banco possui alunos e professores.
    E que o banco possui uma turma.
    E que o banco possui vagas de monitoria voluntaria alocadas.
    E que o "admin" esta logado.

  Cenario: Eu enquanto administrador, quero revisar as vagas de monitoria voluntaria e chego na pagina desejada. (Happy path)
    Dado que eu apertei no botao "revisar vagas de monitoria".
    E que dentro da nova pagina filtrei por "monitorias voluntarias".
    E que existe a disciplina APC
    Entao consigo ver todas as vagas de monitoria voluntarias alocadas na disciplina APC
    E existe o botao aprovar nas linhas da disciplina APC
    E existe o botao reprovar nas linhas da disciplina APC

  Cenario: Eu enquanto administrador nao posso revisar se nao houverem alunos alocados na disciplina
    Dado que eu apertei no botao "revisar vagas de monitoria".
    E que dentro da nova pagina filtrei por "monitorias voluntarias".
    E que existe a disciplina ED
    Entao consigo ver que nao ha vagas de monitoria voluntarias alocadas na disciplina ED
    E nao existe o botao aprovar nas linhas da disciplina ED
    E nao existe o botao reprovar nas linhas da disciplina ED
=======
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

>>>>>>> feature_revisar_monitoria
