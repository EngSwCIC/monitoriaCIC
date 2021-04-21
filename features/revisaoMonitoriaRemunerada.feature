#language pt
Funcionalidade: Como administrador consigo revisar as alocações de vagas de monitoria remunerada.

	Cenario de Fundo:
		Dado que o banco possui uma disciplina.
		E que o banco possui alunos e professores.
		E que o banco possui uma turma.
		E que o banco possui vagas de monitoria remunerada alocadas.
		E que o "admin" está logado.

	Cenário: Eu enquanto administrador, quero revisar as vagas de monitoria remuneradas e chego na página desejada. (Happy path)
		Dado que eu apertei no botão "revisar vagas de monitoria".
		E que dentro da nova página filtrei por "monitorias remuneradas".
		Então consigo ver todas as vagas de monitoria remunerada alocadas e suas respectivas disciplinas.
