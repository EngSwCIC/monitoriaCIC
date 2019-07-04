# language: pt
  Funcionalidade: Como aluno, desejo consultar o histórico de disciplinas que já fui monitor.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "aluno" está logado

    Cenário: O aluno consulta seu histórico de monitorias (Happy Path)
      Quando eu clico em "Histórico"
      Então eu devo estar na página de histórico
      E eu devo ver "Você já foi monitor em"

   