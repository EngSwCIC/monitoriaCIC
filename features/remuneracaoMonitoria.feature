# language: pt
  Funcionalidade: Como professor, sou capaz de verificar se o monitor é remunerado ou voluntário

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "professor" está logado
      
    Cenário: O professor edita uma monitoria (Happy Path)
      Quando eu clico em "Monitoria"
      Então eu devo estar na página de monitoria
      Quando eu clico em "Ver lista de monitores"
      Então eu devo estar na página de monitores da turma
      Quando eu clico em "Alterar Situaçao"
      Então eu devo estar na página de alterar monitoria 1
      E eu devo ver "Remuneração"


