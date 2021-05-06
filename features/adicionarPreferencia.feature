# language: pt
  Funcionalidade: Como professor quero poder registrar minha preferência por um monitor, para selecionar o monitor que mais desejo para aquele cargo.

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      E que o banco possui uma disciplina cadastrada
      E que o banco possui uma turma cadastrada
      E que o banco possui pelo menos uma monitoria cadastrada
      E que o "professor" está logado
      E que o professor esta na página de alterar monitoria

    Cenário: O professor adiciona uma preferência para um monitor (Happy Path)
      Então eu devo ver o seletor de preferência
      Quando eu escolho "3" no seletor "Preferência"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E devo ver "Situaçao Atualizada!"
    
    Cenário: O professor adiciona uma preferência para um monitor que já têm preferência (Happy Path)
      Então eu devo ver o seletor de preferência
      Quando eu escolho "3" no seletor "Preferência"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E devo ver "Situaçao Atualizada!"
      E a preferência atribuída para o monitor deve ser a média da minha preferência com a preferência do outro professor.

    Cenário: O professor adiciona uma preferência errada para um monitor (Sad Path)
      Então eu devo ver o seletor de preferência
      Quando eu não escolho uma opção do seletor "Preferência"
      E eu aperto em "Atualizar"
      Então eu devo estar na página de monitoria
      E devo ver "Situaçao Atualizada!"
      E a preferência atribuída para o monitor deve ser 1, opção padrão do seletor, ou a média de 1 com a preferência de outro professor.