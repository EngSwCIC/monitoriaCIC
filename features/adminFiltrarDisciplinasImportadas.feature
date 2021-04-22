# language: pt
Funcionalidade: Filtrar lista de disciplinas importadas do site de matrícula

    Enquanto administrador,
    Para encontrar uma disciplina específica,
    Eu quero filtrar a lista de disciplinas importadas com uma palavra chave

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de escolha de disciplinas importadas
    E eu importei as seguintes disciplinas:
    |Incluir tabela de disciplinas aqui depois |

Cenário: Filtragem com palavra chave
    Quando eu preencho a caixa de busca com "placeholder"
    E eu clico em "Filtrar"
    Então eu devo ver as seguintes disciplinas:
    |Disciplinas com palavra chave |
    E eu não devo ver as seguintes disciplinas:
    |Disciplinas sem palavra chave |

Cenário: Remover filtragem com caixa vazia
    Quando eu tiver uma lista de disciplinas filtrada
    E eu preencho a caixa de busca com ""
    E eu clico em "Filtrar"
    Então eu devo ver as seguintes disciplinas:
    |Incluir tabela com todas as disciplinas aqui depois |