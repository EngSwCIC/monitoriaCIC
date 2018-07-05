# language: pt
  Funcionalidade: Eu, enquanto Admin, consigo apagar alunos do sistema

    Cenário de Fundo:
      Dado que o banco possui um adminstrador
      E que o banco possui um aluno e um professor
      E que eu estou na página de login de usuários
      E que o "admin" está logado

    Cenário: Admin deleta um aluno existente no banco (Happy Path)
      Quando eu clico em "Apagar alunos"
      Então eu devo estar na página de apagar alunos
      Quando eu preencho o formulário com:
        | Matrícula | 140080279 |
      E aperto em "Deletar aluno"
      Então eu devo estar na página de apagar alunos
      E eu devo ver "Aluno apagado com sucesso!"

    Cenário: Admin tenta deletar um aluno não existente no banco (Sad path)
      Dado que eu estou na página de apagar alunos
      Quando eu preencho o formulário com:
        | Matrícula | 140080278 |
      E aperto em "Deletar aluno"
      Então eu devo estar na página de apagar alunos
      E eu devo ver "Aluno de matrícula 140080278 não existe."

    Cenário: Admin aperta para deletar aluno sem preencher o campo matrícula (Sad path)
      Dado que eu estou na página de apagar alunos
      Quando eu preencho o formulário com:
        | Matrícula | |
      E aperto em "Deletar aluno"
      Então eu devo estar na página de apagar alunos
      E eu devo ver "Digite uma matrícula para deletar algum aluno."