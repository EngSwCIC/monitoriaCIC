# language: pt
Funcionalidade: Como administrador, desejo importar a lista de disciplinas do site do MatrículaWeb

  Cenário de Fundo: Eu, enquanto Administrador, desejo importar a lista de disciplinas do site do CIC
    Dado que o banco possui um adminstrador
    E que o banco possui uma disciplina
    E que eu estou na página de login de usuários
    E que o "admin" está logado

  Cenário: Eu, enquanto Administrador, clico no botão para importar a lista e chego na página desejada
    Dado que está na página de dashboard do usuário
    Quando eu clico em "Importar lista de disciplinas"
    Então eu devo estar na página de importar disciplinas

  Cenário: Eu, enquanto Administrador, estou na página de importação de disciplinas e vejo a disciplina cadastrada no banco
    Dado que eu estou na página de importar disciplinas
    Então eu devo ver "Engenharia de Software"

  Cenário: Eu, enquanto Administrador, clico no botão Importar Disciplinas e vejo as novas disciplinas adicionadas
    Dado que eu estou na página de importar disciplinas
    Quando eu clico em "Importar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E devo ver "Estruturas De Dados"
    E devo ver "Tradutores"