# language: pt
Funcionalidade: Ir para página de turmas de uma disciplina

    Enquanto administrador,
    Para visualizar turmas pertencentes a uma disciplina,
    Eu quero acessar uma página com uma lista de turmas de uma disciplina existente.

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado

Cenário: Disciplina possui turmas
    Dado que as seguintes disciplinas existem:
    |nome|cod_disciplina|
    |ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES|CIC0004|

    E que os seguintes professores existem:
    |name                       |username       |email              |password     |password_confirmation  | role |
    |Guilherme Novaes Ramos     |guilherme      |guilherme@unb.br   |abcdefghi    |abcdefghi              |1     |

    E que as seguintes turmas existem:
    |turma      |professor                  |fk_cod_disciplina  |fk_vagas_id    |
    |TA01       |Guilherme Novaes Ramos     |4                  |1              |

    E que eu estou na página de disciplinas
    Quando eu clico em "Ver Turmas" dentro da seção "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"
    Então eu devo estar na página de informações da disciplina "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"

Cenário: Disciplina não possui turmas
    Dado que as seguintes disciplinas existem:
    |nome|cod_disciplina|
    |ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES|CIC0004|

    E que eu estou na página de disciplinas
    Quando eu clico em "Ver Turmas" dentro da seção "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"
    Então eu devo estar na página de informações da disciplina "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"
    E eu devo ver "Não há turmas cadastradas para esta disciplina"