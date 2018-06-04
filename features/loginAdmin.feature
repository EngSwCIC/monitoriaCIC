# language: pt
  Funcionalidade: ...
    ...

  Cenário de Fundo:
    Dado que eu estou na página inicial do MonitoriaCIC
    Quando eu clico em "Entrar"
    Então eu devo estar na página de login de usuários

    Cenario: ... (Happy Path)
      Quando eu preencho o formulário de cadastro com informações válidas:
        | user[email]     | secretaria@cic.unb.br |
        | user[password]  | 110492                |
      E aperto em "Login"
      Então eu devo estar na página de dashboard do usuário
      E devo ver "Hello, Admin Dasboard!"