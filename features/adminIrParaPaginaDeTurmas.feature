# language: pt
Funcionalidade: Ir para página de turmas de uma disciplina

    Enquanto administrador,
    Para visualizar turmas pertencentes a uma disciplina,
    Eu quero acessar uma página com uma lista de turmas de uma disciplina existente.

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de disciplinas

Cenário: Disciplina possui turmas
    Dado que as seguintes disciplinas existem:
    |nome|
    |ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES|

    E que os seguintes professores existem:
    |name                       |username       |email              |password     |password_confirmation  | role |
    |Guilherme Novaes Ramos     |guilherme      |guilherme@unb.br   |abcdefghi    |abcdefghi              |1     |

    E que as seguintes turmas existem:
    |turma      |professor                  |fk_cod_disciplina  |fk_vagas_id    |
    |TA01       |Guilherme Novaes Ramos     |1                  |1              |

    Quando eu clico em "Ver Turmas" dentro de "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"
    Então eu devo estar na página da turma "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"

Cenário: Disciplina não possui turmas
    Dado que as seguintes disciplinas existem:
    |nome|
    |ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES|

    Quando eu clico em "Ver Turmas" dentro de "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"
    Então eu devo estar na página da turma "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"
    E eu devo ver "Não há turmas cadastradas para essa disciplina"