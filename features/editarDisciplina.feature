# language: pt
  Funcionalidade: Eu, como Coordenador, quero poder editar o status de disponibilidade de uma turma para a monitoria, para indicar para os alunos quais disciplinas podem receber monitor.

    Cenário de Fundo:
      Dado que o banco possui um adminstrador
      E que eu estou na página de login de usuários
      E que o "admin" está logado

      Cenário: Admin atualiza a disciplina 1 (happy path)
        Dado que o banco possui uma disciplina
        E que eu estou na página de disciplinas
        Quando eu clico em "Editar Disciplina"
        Então eu devo estar na página de edição de disciplina
        Quando eu preencho o formulário com:
          | Nome                  | Banco de Dados  |
          | Créditos Práticos     | 2      |
          | Créditos Teóricos     | 2      |
          | Créditos Est          | 2      |
          | Créditos Ext          | 2      |
        E eu aperto em "Atualizar"
        Então eu devo estar na página de disciplinas
        E eu devo ver "Disciplina atualizada!"

      Cenário: Admin deixa o formulário de edição da disciplina 1 em branco (sad path)
        Dado que o banco possui uma disciplina
        E que eu estou na página de disciplinas
        Quando eu clico em "Editar Disciplina"
        Então eu devo estar na página de edição de disciplina
        Quando eu preencho o formulário com:
          | Nome                  | Banco de Dados  |
          | Créditos Práticos     |       |
          | Créditos Teóricos     |       |
          | Créditos Est          |       |
          | Créditos Ext          |       |
        E eu aperto em "Atualizar"
        Então eu devo ver "Ocorreu um erro ao atualizar a disciplina."

      Cenário: Admin disponibiliza monitoria para a disciplina 1 (happy path)
        Dado que o banco possui uma disciplina que nao permite monitoria
        E que eu estou na página de disciplinas
        Quando eu clico em "Editar Disciplina"
        Então eu devo estar na página de edição de disciplina
        E eu marco a checkbox de "Monitoria"
        E eu aperto em "Atualizar"
        Então eu devo estar na página de disciplinas
        E eu devo ver "Disciplina atualizada!"

      Cenário: Admin indisponibiliza monitoria para a disciplina 1 (happy path)
        Dado que o banco possui uma disciplina
        E que eu estou na página de disciplinas
        Quando eu clico em "Editar Disciplina"
        Então eu devo estar na página de edição de disciplina
        E eu marco a checkbox de "Monitoria"
        E eu aperto em "Atualizar"
        Então eu devo estar na página de disciplinas
        E eu devo ver "Disciplina atualizada!"