# language: pt
Funcionalidade: Adicionar disciplinas importadas do site de matrícula ao banco de dados

    Enquanto administrador,
    Para incluir disciplinas no banco de dados de forma definitiva,
    Eu quero usar caixas para escolher quais disciplinas adicionar

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de escolha de disciplinas importadas
    E eu importei as seguintes disciplinas:
    |Incluir tabela de disciplinas aqui depois |

Cenário: Adicionar disciplina marcada
    Quando eu marco as caixas da disciplina "placeholder"
    E eu clico em "Adicionar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E eu devo ver "Disciplina(s) adicionada(s) com sucesso!"
    E eu devo ver as seguintes disciplinas:
    |Disciplina marcada |

Cenário: Adicionar múltiplas disciplinas marcada
    Quando eu marco as caixas das seguintes disciplinas:
    | Tabela aqui|
    E eu clico em "Adicionar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E eu devo ver "Disciplina(s) adicionada(s) com sucesso!"
    E eu devo ver as seguintes disciplinas:
    |Disciplinas marcadas |

Cenário: Nenhuma disciplina marcada
    Quando eu clico em "Adicionar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E eu não devo ver as seguintes disciplinas:
    |Disciplinas incluídas na tabela |

Cenário: Adicionar disciplina existente
    Dado que as seguintes disciplinas existem:
    |Disciplinas previamente adicionadas |
    E eu marco as caixas das seguintes disciplinas:
    |Disciplinas previamente adicionadas |
    E eu clico em "Adicionar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E eu devo ver "Aviso: As disciplinas escolhidas já foram adicionadas"
    E eu devo ver as seguintes disciplinas:
    |Disciplinas previamente adicionadas |