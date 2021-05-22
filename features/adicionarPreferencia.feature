# language: pt
  Funcionalidade: Como professor quero poder registrar minha preferência por um monitor, para selecionar o monitor que mais desejo para aquele cargo.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada com dois professores
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "professor" está logado
      E que o professor está na página de monitores da turma
      E que o professor está na página de alterar monitoria

    Cenário: O professor adiciona uma preferência para um monitor (Happy Path)
      Então eu devo ver "Preferência"
      Quando eu escolho o "3" do seletor "Preferência"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E devo ver "Situaçao atualizada!"
    
    Cenário: Os dois professores adicionam uma preferência (Happy Path)
      Então eu devo ver "Preferência"
      Quando eu escolho o "3" do seletor "Preferência"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E devo ver "Situaçao atualizada!"
      Quando eu clico em "Sair"
      Quando eu clico em "Entrar"
      E que eu estou na página de login de usuários
      E que o "professor auxiliar" está logado
      E que o professor está na página de monitores da turma
      E que o professor está na página de alterar monitoria
      Então eu devo ver "Preferência"
      Quando eu escolho o "2" do seletor "Preferência"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E devo ver "Situaçao atualizada!"
      Quando eu clico em "Ver lista de monitores"
      E eu devo ver "Preferência: 2.5"

    Cenário: O professor adiciona uma preferência errada para um monitor (Sad Path)
      Então eu devo ver "Preferência"
      Quando eu escolho o "Selecionar" do seletor "Preferência"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E devo ver "Para atualizar, escolha uma preferêcia."
      
