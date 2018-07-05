# language: pt
Funcionalidade: Usuário consegue acessar a página 'Editar Perfil' e consegue atualizar seus dados cadastrais

  Cenário de Fundo:
    Dado que o banco possui um aluno e um professor
    Dado que eu estou na página inicial do MonitoriaCIC
    Quando eu clico em "Entrar"
    Então eu devo estar na página de login de usuários

  Cenário: Professor edita qualquer informação do perfil
    Dado que o "professor" está logado
    E que está na página de editar perfil
    Quando eu preencho o formulário com:
      | Nome                  | Genaina Rodrigues |
      | Username              | bernas1104        |
      | Nova senha            | 110492-Bb         |
      | Confirmar nova senha  | 110492-Bb         |
    E eu escolho o "Professor(a)" do seletor "Papel"
    E eu aperto em "Atualizar cadastro"
    Então eu devo estar na página de dashboard do usuário
    E eu devo ver "Cadastro atualizado com sucesso!"

  Cenário: Professor tenta editar perfil com informações inválidas
    Dado que o "professor" está logado
    E que está na página de editar perfil
    Quando eu preencho o formulário com:
      | Nome                  | |
      | Username              | |
      | Nova senha            | |
      | Confirmar nova senha  | |
    E eu aperto em "Atualizar cadastro"
    Então eu devo estar na página de dashboard do usuário
    E eu não devo ver "Cadastro atualizado com sucesso!"