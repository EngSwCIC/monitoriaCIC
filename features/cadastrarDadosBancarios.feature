# language: pt
Funcionalidade: O aluno é capaz de cadastrar e editar seus dados bancários

  Cenário de Fundo:
    Dado que o banco possui um aluno e um professor
    Dado que eu estou na página de login de usuários
    Dado que o "aluno" está logado
    Quando eu clico em "Dados Bancários"
    Então eu devo estar na página de dados bancários

  Cenário: Eu, enquanto aluno, sou capaz de cadastrar meus dados bancários (Happy Path)
    Quando eu clico em "Adicionar"
    Então eu devo estar na página de cadastro de dados bancários
    Quando eu preencho o formulário com:
      | Banco          | Banco do Brasil |
      | Agência        | 33804           |
      | Conta Corrente | 394653          |
    E aperto em "Cadastrar dados bancários"
    Então eu devo estar na página de dados bancários
    E eu devo ver "Dados bancários cadastrados com sucesso!"

  Cenário: Eu, enquanto aluno, adiciono dados bancários com informações inválidas - Sad Path
    Quando eu clico em "Adicionar"
    Então eu devo estar na página de cadastro de dados bancários
    Quando eu preencho o formulário com:
      | Banco          | |
      | Agência        | |
      | Conta Corrente | |
    E aperto em "Cadastrar dados bancários"
    Então eu devo estar na página de dados bancários
    E devo ver "Codigo can't be blank"
    E devo ver "Codigo is too short (minimum is 6 characters"
    E devo ver "Agencia can't be blank"
    E devo ver "Agencia only numbers"
    E devo ver "Conta corrente can't be blank"
    E devo ver "Conta corrente only numbers"