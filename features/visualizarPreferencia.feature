# language: pt
  Funcionalidade: Como professor quero poder visualizar a preferência de um monitor, para saber o monitor com a maior preferência.
    
    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada com dois professores
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "professor" está logado
      E que o professor está na página de monitores da turma
    
    Cenário: O professor visualiza a preferência(Happy Path)
      E eu devo ver "Preferência: 0.0"

    Cenário: O professor visualiza a preferência dada (Happy Path)
      E que o professor deu uma preferência para o monitor
      E eu devo ver "Preferência: 1"

    Cenário: O professor visualiza a média aritimética das preferências (Happy Path)
      E que dois professores deram uma preferência para o monitor
      E eu devo ver "Preferência: 1.5"
