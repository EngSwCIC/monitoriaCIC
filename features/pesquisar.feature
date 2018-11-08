<<<<<<< HEAD
# language: pt
Funcionalidade: Eu, enquanto aluno, quero pesquisar oferta de monitoria por disciplina

  Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "aluno" está logado

  Cenário: Aluno realiza busca por disciplina (Happy Path)
    Quando eu clico em "Monitoria"
    Então eu devo estar na página de monitoria
    Quando eu preencho o campo "Busca por Disciplina"
    E digito uma disciplina que o banco possui
    E aperto em "Pesquisar"
    Então eu devo estar na página de monitoria
    E eu devo ver "Disciplina encontrada"
    
  Cenário: Aluno realiza busca por disciplina não ofertada (Sad Path)
    Quando eu clico em "Monitoria"
    Então eu devo estar na página de monitoria
    Quando eu preencho o campo "Busca por Disciplina"
    E digito uma disciplina que o banco não possui
    E aperto em "Pesquisar"
    Então eu devo estar na página de monitoria
    E eu devo ver "Disciplina não possui oferta de monitoria"
=======
Como aluno quero pesquisar oferta de monitoria
>>>>>>> b4bf40e05751f75759d4a0bba3d9ea5f270e2b1e
