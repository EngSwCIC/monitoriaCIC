# language: pt
  Funcionalidade: Eu, enquanto aluno, consigo realizar login no sistema

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que eu estou na página de login de usuários

    Cenário: Aluno, cadastrado, realiza o login (Happy Path)
      Quando eu preencho o formulário de login com:
        | user_email    | bernardoc1104@gmail.com |
        | user_password | 110492                  |
      E aperto em "Login"
      Então eu devo estar na página de dashboard do usuário

    Cenário: Aluno insere uma conta inválida/inexistente e não realiza login (Sad Path)
      Quando eu preencho o formulário de login com:
        | user_email    | bernardoc1105@gmail.com |
        | user_password | 123456                  |
      E aperto em "Login"
      Então eu devo estar na página de login de usuários
      E eu devo ver "Email ou senha inválidos"