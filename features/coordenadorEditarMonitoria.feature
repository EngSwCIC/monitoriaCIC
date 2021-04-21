# language: pt
Funcionalidade: Eu, como coordenador sou capaz de aceitar ou recusar um monitor de qualquer turma, sendo capaz de alterar a situação do mesmo.
	Cenário de Fundo:
		Dado que o banco possui um administrador
		E que o banco possui um aluno e um professor
		E que o banco possui uma disciplina
		E que o banco possui uma turma cadastrada
		E que o banco possui uma monitoria
		E que estou na página de login de usuários
		E que o "admin" está logado

	Cenário: O coordenador altera a situação de uma aplicação de um monitor (Happy Path)
    Dado que o período de inscrição da monitoria esteja encerrado
		Quando eu clico em "Monitorias"
		Então eu devo estar na página de monitorias
		Quando eu clico em "Ver lista de monitores"
		Então eu devo estar na página de monitores da turma
		E eu devo ver "Pendente"
		Quando eu clico em "Alterar Situação"
		Então eu devo estar na página de alterar monitoria 1
		Quando eu escolho o "Aceito" do seletor "Situação"
		E eu aperto em "Atualizar"
		Então eu devo estar na página de monitoria
		E eu devo ver "Situação atualizada!"

  Cenário: O coordenador altera a situação de uma aplicação de um monitor (Sad Path)
		Quando eu clico em "Monitorias"
		Então eu devo estar na página de monitorias
		Quando eu clico em "Ver lista de monitores"
		Então eu devo estar na página de monitores da turma
		E eu devo ver "Pendente"
		Quando eu clico em "Alterar Situação"
		Então eu devo estar na página de alterar monitoria 1
		Quando eu escolho o "Aceito" do seletor "Situação"
		E eu aperto em "Atualizar"
		Então eu devo estar na página de monitoria
		E eu devo ver "Falha! Período de inscrição ainda está aberto"