# language: pt
  Funcionalidade: Disciplinas podem ser visualizadas, editadas, removidas e criadas.
    Professores podem visualizar, editar, remover e criar disciplinas.
    Alunos podem apenas visualizar.

  Cenário de Fundo:
      Dado que  o banco possui um aluno e um professor
      Dado que  o banco possui uma disciplina
      Dado que eu estou na página inicial do MonitoriaCIC
      Quando eu clico em "Entrar"
      Então eu devo estar na página de login de usuários

    Cenário: Aluno acessa a página disciplinas
        Quando eu preencho o formulário de login com:
          | user_email    | bernardoc1104@gmail.com |
          | user_password | 110492                  |
        E eu aperto em "Login"
        Então eu devo estar na página de dashboard do usuário
        Quando eu clico em "Disciplinas"
        Então eu devo estar na página de disciplinas

    Cenário: Professor acessa a página editar perfil
        Quando eu preencho o formulário de login com:
          | user_email    | genaina@unb.br          |
          | user_password | 123456                  |
        E eu aperto em "Login"
        Então eu devo estar na página de dashboard do usuário
        Quando eu clico em "Disciplinas"
        Então eu devo estar na página de disciplinas

    Cenário: Aluno acessa uma disciplina
        Dado que o "aluno" está logado
        E que está na página de disciplinas
        Então eu não devo ver "Adicionar nova Disciplina"
        Quando eu clico em "Mais Informações"
        Então eu devo estar na página de informações da disciplina 1
        E eu não devo ver "Editar"
        E eu não devo ver "Deletar"

    Cenário: Professor acessa uma disciplina
        Dado que o "professor" está logado
        E que está na página de disciplinas
        Então eu devo ver "Adicionar nova Disciplina"
        Quando eu clico em "Mais Informações"
        Então eu devo estar na página de informações da disciplina 1
        E eu devo ver "Editar"
        E eu devo ver "Deletar"

    Cenário: Professor edita uma disciplina
        Dado que o "professor" está logado
        E que está na página de disciplinas
        Quando eu clico em "Mais Informações"
        Então eu devo estar na página de informações da disciplina 1
        Quando eu clico em "Editar"
        Então eu devo estar na página de edição da disciplina 1
        Quando eu preencho o formulário com:
          | Nome                  | Banco de Dados  |
          | Créditos Práticos     | 2      |
          | Créditos Teóricos     | 2      |
          | Créditos Est          | 2      |
          | Créditos Ext          | 2      |
        E eu escolho o "Optativa" do seletor "Tipo"
        E eu aperto em "Atualizar"
        Então eu devo estar na página de disciplinas
        E eu devo ver "Disciplina atualizada!"

    Cenário: Professor adiciona uma disciplina
        Dado que o "professor" está logado
        E que está na página de disciplinas
        Quando eu clico em "Adicionar nova Disciplina"
        Então eu devo estar na página de nova disciplina
        Quando eu preencho o formulário com:
          | Nome                  | Banco de Dados  |
          | Créditos Práticos     | 2      |
          | Créditos Teóricos     | 2      |
          | Créditos Est          | 2      |
          | Créditos Ext          | 2      |
        E eu escolho o "Optativa" do seletor "Tipo"
        E eu aperto em "Cadastrar"
        Então eu devo estar na página de disciplinas
        E eu devo ver "Disciplina cadastrada com sucesso!"

    Cenário: Professor remove uma disciplina
        Dado que o "professor" está logado
        E que está na página de disciplinas
        Quando eu clico em "Mais Informações"
        Então eu devo estar na página de informações da disciplina 1
        Quando eu clico em "Deletar"
        Então eu devo estar na página de disciplinas
        E eu devo ver "Disciplina removida!"