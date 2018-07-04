# language: pt
  Funcionalidade: Eu, enquanto professor, sou capaz de cadastrar novas turmas no sistema

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui uma turma cadastrada
      E que eu estou na página de login de usuários
      E que o "professor" está logado

    Cenário: O professor efetua o cadastro de uma nova turma (Happy Path)
      Quando eu clico em "Turmas"
      Então eu devo estar na página de turmas
      Quando eu clico em "Cadastrar nova turma"
      Então eu devo estar na página de cadastro de turmas
      Quando eu escolho o "C" do seletor "turma_turma"
      E eu escolho o "Engenharia de Software" do seletor "turma_fk_cod_disciplina"
      E eu escolho o "4" do seletor "turma_qnt_bolsas"
      E aperto em "Cadastrar turma"
      Então eu devo estar na página de turmas
      E eu devo ver "Turma cadastrada com sucesso!"

    Cenário: O professor tenta cadastrar uma turma já existente para uma dada disciplina (Sad Path)
      E que eu estou na página de cadastro de turmas
      Quando eu escolho o "A" do seletor "turma_turma"
      E eu escolho o "Engenharia de Software" do seletor "turma_fk_cod_disciplina"
      E eu escolho o "2" do seletor "turma_qnt_bolsas"
      E aperto em "Cadastrar turma"
      Então eu devo estar na página de turmas
      E eu devo ver "Turma A não é a única para a disciplina Engenharia de Software"