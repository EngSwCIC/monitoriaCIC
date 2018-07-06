# language: pt
  Funcionalidade: Como aluno, para que possa ser monitor no proximo semestre, quero poder me inscrever para monitor.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui duas turmas cadastradas
      E que o banco possui uma monitoria
      E que eu estou na página de login de usuários
      E que o "aluno" está logado

    Cenário: O aluno efetua o processo de aplicar para monitoria (Happy Path)
      Quando eu clico em "Monitoria"
      Então eu devo estar na página de monitoria
      Quando eu clico em "link_1"
      Então eu devo estar na página de nova monitoria
      Quando eu escolho o "Remunerada" do seletor "Remuneraçao"
      E eu escolho o "B" do seletor "Turma"
      E eu preencho "Descriçao" com "Nota: SS. IRA: 3."
      E aperto em "Cadastrar"
      Então eu devo estar na página de monitoria
      E eu devo ver "Aplicaçao para monitoria enviada com sucesso!"

    Cenário: O aluno tenta aplicar novamente para monitoria na mesma turma de uma dada disciplina (Sad Path)
      Quando eu clico em "Monitoria"
      Então eu devo estar na página de monitoria
      Quando eu clico em "link_2"
      Então eu devo estar na página de nova monitoria
      Quando eu escolho o "Remunerada" do seletor "Remuneraçao"
      E eu escolho o "A" do seletor "Turma"
      E eu preencho "Descriçao" com "Nota: SS. IRA: 3."
      E aperto em "Cadastrar"
      Então eu devo estar na página de monitoria
      E eu devo ver "Ocorreu um erro ao cadastrar a monitoria. Nenhuma monitoria cadastrada."