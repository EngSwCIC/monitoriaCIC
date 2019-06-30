# language: pt
Funcionalidade: Como administrador, desejo importar a lista de professores do site do CIC

  Cenário de Fundo: Eu, enquanto Administrador, desejo importar a lista de professores do site do CIC
    Dado que o banco possui um adminstrador
    E que o banco possui um aluno e um professor
    E que eu estou na página de login de usuários
    E que o "admin" está logado

  Cenário: Eu, enquanto Administrador, clico no botão para importar a lista e chego na página desejada
    Quando eu clico em "Importar lista de professores"
    Então eu devo estar na página de importar professores

  Cenário: Eu, enquanto Administrador, estou na página de importação e vejo a professora cadastrada no banco e seu
    respectivo e-mail
    Dado que eu estou na página de importar professores
    Então eu devo ver "Genaina Nunes Rodrigues"
    E devo ver "genaina@unb.br"

  Cenário: Eu, enquanto Administrador, clico no botão Importar Professores e vejo os novos professores adicionados
    Dado que eu estou na página de importar professores
    Quando eu clico em "Importar professores"
    Então eu devo estar na página de importar professores
    E devo ver "Alba Cristina Magalhaes Alves de Melo"
    E devo ver "alves@unb.br"
    E devo ver "Marcus Vinicius Lamar"
    E devo ver "lamar@unb.br"
    E devo ver "Vander Ramos Alves"
    E devo ver "valves@unb.br"