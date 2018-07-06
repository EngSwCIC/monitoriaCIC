# language: pt
  Funcionalidade: Como aluno, para caso eu me arrependa de aplicar para monitor, quero poder remover minha aplicaçao.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "aluno" está logado

    Cenário: O aluno consegue remover seu cadastro para monitor (Happy path)
      Dado que eu estou na página de monitoria
      Quando eu clico em "Remover aplicaçao"
      Então eu devo estar na página de monitoria
      E eu devo ver "Monitoria removida!"