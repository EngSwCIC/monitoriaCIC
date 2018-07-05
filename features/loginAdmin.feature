# language: pt
  Funcionalidade: O administrador do sistema consegue realizar o login

  Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que eu estou na página inicial do MonitoriaCIC
    Quando eu clico em "Entrar"
    Então eu devo estar na página de login de usuários

    Cenario: Eu, enquanto Adminstrador, consigo acessar o sistema com a minha conta (Happy Path)
      Quando eu preencho o formulário com:
        | user[email]     | secretaria@cic.unb.br |
        | user[password]  | 110492                |
      E aperto em "Login"
      Então eu devo estar na página de dashboard do usuário

    Cenário: Eu, enquanto Administrador, não consigo acessar o sistema com uma conta inválida (Sad Path)
      Quando eu preencho o formulário com:
        | user[email]     | secretaria@cic.unb.br |
        | user[password]  | 123456                |
      E aperto em "Login"
      Então eu devo estar na página de login de usuários
      E devo ver "Email ou senha inválidos"