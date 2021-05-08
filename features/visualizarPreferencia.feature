# language: pt
  Funcionalidade: Como professor quero poder visualizar a preferência de um monitor, para saber o monitor com a maior preferência.
    
    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada com dois professores
      E que o banco possui uma monitoria
      E que dois professores deram uma preferência para o monitor
      E que eu estou na página de login de usuários
      E que o "professor" está logado
      E que o professor está na página de monitores da turma

    Cenário: O professor visualiza a preferência de um monitor (Happy Path)
      Devo visualizar, em cada card de Aluno, o campo de preferência
      O campo de preferência deve conter a média das preferências dos professores

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada com apenas um professor
      E que o banco possui uma monitoria
      E que o professor deu uma preferência para o monitor
      E que eu estou na página de login de usuários
      E que o "professor" está logado
      E que o professor está na página de monitores da turma

    Cenário: O professor auxiliar visualiza a preferência de um monitor (Happy Path)
      Devo visualizar, em cada card de Aluno o campo de preferência
      O campo de preferência deve conter a preferência dada pelo único professor