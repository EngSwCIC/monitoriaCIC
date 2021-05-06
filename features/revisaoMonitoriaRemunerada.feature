#language: pt
Funcionalidade: Como administrador consigo revisar as alocações de vagas de monitoria remunerada.

	Cenário de Fundo:
		Dado que o banco possui duas disciplinas
		E que o banco possui alunos
		E que o banco possui quatro turmas cadastradas
		E que o banco possui monitorias pendentes cadastradas
		E que o banco possui um adminstrador
    E que eu estou na página de login de usuários
		E que o "admin" está logado

	Cenário: Enquanto administrador, quero revisar as vagas de monitoria remuneradas e chego na página desejada. (Happy path)
    Quando eu clico em "Vagas de monitoria"
		E aperto em "Alocar"
		E eu devo ver "Alunos alocados com sucesso!"
		E clico em "Monitoria Remunerada"
		E eu devo ver "Disciplina", "Bolsas Restantes", "Monitores" e "Turma"
		Então eu devo ver os monitores alocados

	Cenário: Enquanto administrador, quero revisar as vagas de monitoria remuneradas e chego na página desejada. (Sad path)
		Quando eu clico em "Vagas de monitoria"
		E clico em "Monitoria Remunerada"
		E devo ver "Disciplina", "Bolsas Restantes", "Monitores" e "Turma"
		Então não devo ver os monitores alocados

	Cenário: Enquanto administrador, quero editar as monitorias alocadas. (Happy path)
		Quando eu clico em "Vagas de monitoria"
		E aperto em "Alocar"
		E eu devo ver "Alunos alocados com sucesso!"
		E clico em "Monitoria Remunerada"
		E clico em "Ver lista de monitores" na primeira turma
    Então eu devo estar na página de monitores remunerado da turma
    E eu devo ver "Aceito"
    Quando eu clico em "Alterar Situaçao" do monitor
    Então eu devo estar na página de alterar a monitoria remunerada 4
    Quando eu escolho o "Aceito" do seletor "Situaçao"
    E eu aperto em "Atualizar"
    E eu devo ver "Situaçao atualizada!"