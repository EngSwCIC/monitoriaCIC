Como administrador quero apagar professor



 Funcionalidade: Eu, enquanto administrador, consigo apagar professores do sistema

    Cenário de Fundo:
      Dado que o banco possui um adminstrador
      E que o banco possui um professor
      E que eu estou na página de login de usuários
      E que o "admin" está logado

    Cenário: Admin deleta um professor existente no banco (Happy Path)
      Quando eu clico em "Apagar professores"
      Então eu devo estar na página de apagar professores
      Quando eu preencho o formulário com:
        | Usuário | Joao |
      E aperto em "Deletar professor"
      Então eu devo estar na página de apagar professores
      E eu devo ver "professor apagado com sucesso!"

    Cenário: Admin tenta deletar um professor não existente no banco (Sad path)
      Dado que eu estou na página de apagar professores
      Quando eu preencho o formulário com:
        | Usuário | Joao |
      E aperto em "Deletar professor"
      Então eu devo estar na página de apagar professores
      E eu devo ver "professor de Usuário Joao não existe."

    Cenário: Admin aperta para deletar professor sem preencher o campo Usuário (Sad path)
      Dado que eu estou na página de apagar professores
      Quando eu preencho o formulário com:
        | Usuário | |
      E aperto em "Deletar professor"
      Então eu devo estar na página de apagar professores
      E eu devo ver "Digite uma Usuário para deletar algum professor."