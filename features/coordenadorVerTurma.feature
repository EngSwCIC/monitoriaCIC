Funcionalidade: Eu, enquanto coodenador, sou capaz de ver todas as turmas criadas.
	Cenário de Fundo:
		Dado que o banco possui um administrador
		E que o banco possui um aluno e um professor
		E que o banco possui uma disciplina 
		E que eu estou na página de login de usuários
		E que o "admin" está logado

	Cenário: O coodenador consegue ver todas as turmas cadastradas (Happy path)
		Dado que o banco possui uma turma cadastrada
		Quando eu clico em "Turmas"
		Então eu devo ver "Lista de turmas"
		
	Cenário: O coodenador não visualiza nenhuma turma pois nenhuma foi criada ainda (Sad path)
		Quando eu clico em "Todas as Turmas"
		Então eu devo ver "Nenhuma turma cadastrada ainda"