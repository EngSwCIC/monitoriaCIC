# language: pt
Funcionalidade: O aluno é capaz de cadastrar e editar seus dados bancários

  Cenário de Fundo:
    Dado que o banco possui um aluno e um professor
    Dado que eu estou na página de login de usuários
    Dado que o "aluno" está logado
    Quando eu clico em "Dados Bancários"
    Então eu devo estar na página de dados bancários

  Cenário: Eu, enquanto aluno, sou capaz de apagar meus dados bancários
    Dado que eu possuo dados bancários cadastrados
    E eu clico em "Dados Bancários"
    Quando eu clico em "Apagar dados"
    Então eu devo estar na página de dados bancários
    E devo ver "Você ainda não possui dados bancários cadastrados."