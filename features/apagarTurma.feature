# language: pt
  Funcionalidade: Eu, enquanto professor, sou capaz de apagar turmas que cadastrei

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que eu estou na página de login de usuários
      E que o "professor" está logado

    Cenário: O professor consegue apagar uma turma cadastrada (Happy path)
      Dado que eu estou na página de turmas
      Quando eu clico em "Apagar turma"
      Então eu devo estar na página de turmas
      E eu devo ver "Turma apagada com sucesso!"