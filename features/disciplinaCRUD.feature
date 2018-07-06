# language: pt
  Funcionalidade: Disciplinas podem ser visualizadas, editadas, removidas e criadas.
    Administradores podem visualizar, editar, remover e criar disciplinas.

  Cenário de Fundo:
      Dado que o banco possui um adminstrador
      Dado que o banco possui um aluno e um professor
      Dado que o banco possui uma disciplina
      Dado que eu estou na página inicial do MonitoriaCIC
      Quando eu clico em "Entrar"
      Então eu devo estar na página de login de usuários

    Cenário: Admin acessa uma disciplina
        Dado que o "admin" está logado
        E que está na página de disciplinas
        Então eu devo ver "Adicionar nova Disciplina"
        E eu devo ver "Editar Disciplina"
        E eu devo ver "Apagar Disciplina"

    Cenário: Admin edita uma disciplina
        Dado que o "admin" está logado
        E que está na página de disciplinas
        Quando eu clico em "Editar Disciplina"
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

    Cenário: Admin adiciona uma disciplina
        Dado que o "admin" está logado
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

    Cenário: Admin remove uma disciplina
        Dado que o "admin" está logado
        E que está na página de disciplinas
        Quando eu clico em "Apagar Disciplina"
        Então eu devo estar na página de disciplinas
        E eu devo ver "Disciplina removida!"