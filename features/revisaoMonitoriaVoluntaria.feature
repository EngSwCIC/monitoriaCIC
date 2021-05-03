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
  Quando eu clico em "Revisar vagas de monitoria"
  Entao eu devo estar na pagina de revisão de monitorias
  E eu devo ver "Remuneração: Voluntária"
  E eu devo ver "Aluno: Bernardo Costa Nascimento"
  E eu devo ver "Status: "
#  E que dentro da nova pagina filtrei por "monitorias voluntarias".
#  E que existe a disciplina APC
  Entao consigo ver todas as vagas de monitoria voluntarias alocadas na disciplina APC
  E existe o botao aprovar nas linhas da disciplina APC
  E existe o botao reprovar nas linhas da disciplina APC
#
#Cenario: Eu enquanto administrador nao posso revisar se nao houverem alunos alocados na disciplina
#  Dado que eu apertei no botao "revisar vagas de monitoria".
#  E que dentro da nova pagina filtrei por "monitorias voluntarias".
#  E que existe a disciplina ED
#  Entao consigo ver que nao ha vagas de monitoria voluntarias alocadas na disciplina ED
#  E nao existe o botao aprovar nas linhas da disciplina ED
#  E nao existe o botao reprovar nas linhas da disciplina ED

