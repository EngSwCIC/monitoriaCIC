# language: pt
  Funcionalidade: Como professor, para que eu possa aceitar ou recusar um monitor, quero poder alterar a situção do mesmo.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "professor" está logado

    Cenário: O professor confere que todos os campos foram preenchidos (Happy Path)
      Quando eu clico em "Monitoria"
      Então eu devo estar na página de monitoria
      Quando eu clico em "Ver lista de monitores"
      Então eu devo estar na página de monitores da turma
      E eu devo ver "Menção"
      E eu devo ver "IRA"
      E eu devo ver "Histórico Escolar"

    Cenário: O professor altera a situação de uma aplicação de um monitor (Happy Path)
      Quando eu clico em "Monitoria"
      Então eu devo estar na página de monitoria
      Quando eu clico em "Ver lista de monitores"
      Então eu devo estar na página de monitores da turma
      E eu devo ver "Pendente"
      Quando eu clico em "Alterar Situaçao"
      Então eu devo estar na página de alterar monitoria 1
      Quando eu escolho o "Aceito" do seletor "Situaçao"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E eu devo ver "Situaçao atualizada!"

   