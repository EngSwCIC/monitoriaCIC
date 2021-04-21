# language: pt
Funcionalidade: Eu, enquanto coodenador, sou capaz de ver todas as turmas que tem pelo menos uma aplicação para monitor.
	Cenário de Fundo:
		Dado que o banco possui um administrador
		E que o banco possui um aluno e um professor
		E que o banco possui uma disciplina 
    E que o banco possui uma turma cadastrada
		E que eu estou na página de login de usuários
		E que o "admin" está logado

	Cenário: O coodenador consegue ver todas turmas que tenha pelo menos uma aplicação para monitoria (Happy path)
		Dado que o banco possui uma monitoria
		Quando eu clico em "Monitoria"
		Então eu devo ver "Ver lista de monitores"
		
	Cenário: O coodenador não visualiza nenhuma turma pois nenhuma turma teve aplicação para monitoria (Sad path)
		Quando eu clico em "Monitoria"
		Então eu devo ver "Nenhuma turma cadastrada ainda"