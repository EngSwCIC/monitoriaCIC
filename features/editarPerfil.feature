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

      Cenário: Aluno edita qualquer informação do perfil
        Dado que o "aluno" está logado
        E que está na página de editar perfil
        Quando eu preencho o formulário com:
          | Nome                  | Bernardo Costa  |
          | Matricula             | 123456789       |
          | CPF                   | 09646418104     |
          | RG                    | 1234567         |
          | Nova senha            | 110492-Bb       |
          | Confirmar nova senha  | 110492-Bb       |
        E eu aperto em "Atualizar cadastro"
        Então eu devo estar na página de dashboard do usuário
        E eu devo ver "Cadastro atualizado com sucesso!"

      Cenário: Professor edita qualquer informação do perfil
        Dado que o "professor" está logado
        E que está na página de editar perfil
        Quando eu preencho o formulário com:
          | Nome                  | Bernardo Costa  |
          | Username              | bernas1104      |
          | Nova senha            | 110492-Bb       |
          | Confirmar nova senha  | 110492-Bb       |
        E eu escolho o "Professor(a)" do seletor "Papel"
        E eu aperto em "Atualizar cadastro"
        Então eu devo estar na página de dashboard do usuário
        E eu devo ver "Cadastro atualizado com sucesso!"