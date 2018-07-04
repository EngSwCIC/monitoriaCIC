# language: pt
  Funcionalidade: Eu, enquanto professor, sou capaz de editar uma turma cadastrada.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina
      E que o banco possui duas turmas cadastradas
      E que eu estou na página de login de usuários
      E que o "professor" está logado

    Cenário: O professor efetua a edição de uma turma existente (Happy Path)
      Quando eu clico em "Turmas"
      Então eu devo estar na página de turmas
      # edit_1 = id do link 'Editar dados' para Turma de id = 1
      Quando eu clico em "edit_1" da primeira turma
      Então eu devo estar na página de edição de turma
      Quando eu escolho o "H" do seletor "turma_turma"
      E eu escolho o "Engenharia de Software" do seletor "turma_fk_cod_disciplina"
      E eu escolho o "3" do seletor "turma_qnt_bolsas"
      E eu aperto em "Atualizar turma"
      Então eu devo estar na página de turmas
      E eu devo ver "Turma atualizada com sucesso!"

    Cenário: O professor tenta atualizar a turma para uma turma existente da mesma disciplina (Sad Path)
      Dado que eu estou na página de turmas
      # edit_1 = id do link 'Editar dados' para Turma de id = 1
      Quando eu clico em "edit_1" da primeira turma
      Então eu devo estar na página de edição de turma
      Quando eu escolho o "B" do seletor "turma_turma"
      E eu escolho o "Engenharia de Software" do seletor "turma_fk_cod_disciplina"
      E eu escolho o "9" do seletor "turma_qnt_bolsas"
      E eu aperto em "Atualizar turma"
      Então eu devo estar na página de turmas
      E eu devo ver "Turma B não é a única para a disciplina Engenharia de Software"