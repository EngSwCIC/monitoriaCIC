# language: pt
Funcionalidade: Eu, enquanto coordenador, sou capaz de editar o número de vagas de uma turma cadastrada.
	Cenário de Fundo:
		Dado que o banco possui um administrador
		E que o banco possuiu um aluno e um professor
		E que o banco possui uma disciplina
		E que o banco possui uma turma cadastrada
		E que eu estou na página de login de usuários
		E que o "admin" está logado
		Quando eu clico em "Turmas"
		Então eu devo estar na página de turmas

	Cenário: O coodenador altera a quantidade de bolsas disponiveis em uma turma (Happy Path)
		Quando eu clico em "edit_1" da turma
		Então eu devo estar na página de edição de turma
		Quando eu escolho o "1" do seletor "turma_qnt_bolsas"
		E aperto em "Atualizar turma"
		Então eu devo estar na página de turmas
		E eu devo ver "Turma atualizada com sucesso!" 

	Cenário: O coordenador tenta alterar a quantidade de bolsas para um valor menor do que o número aceito de monitores (Sad Path)
		Dado que o banco possui duas monitorias
		Quando eu clico em "edit_1" da turma
		Então eu devo estar na página de edição de turma
		Quando eu escolho o "0" do seletor "turma_qnt_bolsas"
		E aperto em "Atualizar turma"
		Então eu devo estar na página de turmas
		E eu devo ver "Turma possui uma quantidade de alunos aceito maior que a nova quantidade de vagas disponiveis!"