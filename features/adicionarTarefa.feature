# language: pt
  Funcionalidade: Como um professor, para que eu possa avaliar o monitor, eu gostaria de adicionar atividades para o monitor.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que o banco possui duas monitorias
      E que eu estou na página de login de usuários
      E que o "professor" está logado

    Cenário: O professor designa uma tarefa para o monitor (Happy Path)
      Quando eu clico em "Monitoria"
      Então eu devo estar na página de monitoria
      Quando eu clico em "Ver lista de monitores"
      Então eu devo estar na página de monitores da turma
      Quando eu clico em "Tarefas"
      Então eu devo estar na página de tarefas do monitor
      Quando eu clico em "Designar tarefa"
      Então eu devo estar na página de cadastro de tarefas
      Quando eu preencho o formulário com:
      | Titulo         | Corrigir Trabalho           |
      | Descricao      | Corrigir varios trabalhos   |
      E aperto em "Salvar"
      Então eu devo estar na página da tarefa