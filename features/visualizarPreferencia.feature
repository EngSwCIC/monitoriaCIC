# language: pt
  Funcionalidade: Como professor quero poder visualizar a preferência de um monitor, para saber o monitor com a maior preferência.
    
    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina cadastrada
      E que o banco possui uma turma cadastrada
      E que o banco possui pelo menos uma monitoria cadastrada
      E que a turma possui dois professores
      E que dois professores deram uma preferência para o monitor
      E que o "professor" está logado
      E que já foi dada uma preferência para os alunos por ambos os professores
      E que o professor está na página de monitores da turma

    Cenário: O professor visualiza a preferência de um monitor (Happy Path)
      Devo visualizar, em cada card de Aluno, o campo de preferência
      O campo de preferência deve conter a média harmônica das preferências dos professores

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina cadastrada
      E que o banco possui uma turma cadastrada
      E que o banco possui pelo menos uma monitoria cadastrada
      E que a turma possui apenas um professor
      E que o professor deu uma preferência para o monitor
      E que o "professor" está logado
      E que o professor já deu sua preferência para os alunos
      E que o professor está na página de monitores da turma

    Cenário: O professor visualiza a preferência de um monitor (Happy Path)
      Devo visualizar, em cada card de Aluno o campo de preferência
      O campo de preferência deve conter a preferência dada pelo único professor