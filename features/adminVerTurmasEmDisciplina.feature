# language: pt
Funcionalidade: Ver uma lista de turmas de uma disciplina

    Enquanto administrador,
    Para visualizar turmas pertencentes a uma disciplina,
    Eu quero ver uma lista de turmas de uma disciplina existente em uma página própria.

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que as seguintes disciplinas existem:
    |nome|
    |ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES|

    E que eu estou na página da turma "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"

Cenário: Disciplina possui turmas
    Dado que os seguintes professores existem:
    |name                       |username       |email              |password     |password_confirmation  | role |
    |Guilherme Novaes Ramos     |guilherme      |guilherme@unb.br   |abcdefghi    |abcdefghi              |1     |

    E que as seguintes turmas existem:
    |turma      |professor                  |fk_cod_disciplina  |fk_vagas_id    |
    |TA01       |Guilherme Novaes Ramos     |1                  |1              |

    Quando eu clico em "Ver Turmas" dentro de "ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"
    Então eu devo ver:
    |TA01|

    E eu devo ver:
    |Guilherme Novaes Ramos|

Cenário: Disciplina não possui turmas
    Então eu devo ver "Não há turmas cadastradas para essa disciplina"