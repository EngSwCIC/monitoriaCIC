# language: pt
  Funcionalidade: O aluno é capaz de cadastrar e editar seus dados bancários

    Cenário de Fundo:
      Dado que o banco possui um aluno e um professor
      Dado que eu estou na página de login de usuários
      Dado que o "aluno" está logado
      Quando eu clico em "Dados Bancários"
      Então eu devo estar na página de dados bancários

    Cenário: Eu, enquanto aluno, sou capaz de cadastrar meus dados bancários
      Quando eu clico em "Adicionar"
      Então eu devo estar na página de cadastro de dados bancários
      Quando eu preencho o formulário com:
        | Banco          | Banco do Brasil |
        | Agência        | 33804           |
        | Conta Corrente | 394653          |
      E aperto em "Cadastrar dados bancários"
      Então eu devo estar na página de dados bancários
      E eu devo ver "Dados bancários cadastrados com sucesso!"

    Cenário: Eu, enquanto aluno, sou capaz de editar meus dados bancários
      Dado que eu possuo dados bancários cadastrados
#      Quando eu clico no link "Editar dados"
      Dado que eu estou na página de edição de dados bancários
#      Então eu devo estar na página de edição de dados bancários
      Quando eu preencho o formulário com:
        | Banco          | Banco Bradesco  |
        | Agência        | 34219           |
        | Conta Corrente | 318529          |
      E aperto em "Atualizar dados bancários"
      Então eu devo estar na página de dados bancários
      E devo ver "Dados atualizados com sucesso!"