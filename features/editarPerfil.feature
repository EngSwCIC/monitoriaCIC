# language: pt
  Funcionalidade: Usuário consegue acessar a página 'Editar Perfil' e consegue atualizar seus dados cadastrais

    Cenário de Fundo:
      Dado que  o banco possui um aluno e um professor
      Dado que eu estou na página inicial do MonitoriaCIC
      Quando eu clico em "Entrar"
      Então eu devo estar na página de login de usuários

    Cenário: Aluno acessa a página editar perfil
      Quando eu preencho o formulário de login com:
        | user_email    | bernardoc1104@gmail.com |
        | user_password | 110492                  |
      E eu aperto em "Login"
      Então eu devo estar na página de dashboard do usuário
      Quando eu clico em "Editar Perfil"
      Então eu devo estar na página de editar perfil do usuário


    Cenário: Professor acessa a página editar perfil
      Quando eu preencho o formulário de login com:
        | user_email    | genaina@unb.br          |
        | user_password | 123456                  |
      E eu aperto em "Login"
      Então eu devo estar na página de dashboard do usuário
      Quando eu clico em "Editar Perfil"
      Então eu devo estar na página de editar perfil do usuário