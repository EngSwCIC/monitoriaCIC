# language: pt
Funcionalidade: Ver uma lista de turmas de uma disciplina

    Enquanto administrador,
    Para visualizar turmas pertencentes a uma disciplina,
    Eu quero ver uma lista de turmas de uma disciplina existente em uma página própria.

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que a disciplina "Algoritmos e Programação de Computadores" existe
    E que eu estou na página da turma "Algoritmos e Programação de Computadores"

Cenário: Disciplina possui turmas
    Dado que as seguintes turmas existem:
    |Turmas de APC|
    E que os seguintes professores existem:
    |Professores de APC|
    Quando eu clico em "Ver Turmas" dentro de "Algoritmos e Programação de Computadores"
    Então eu devo ver as seguintes turmas:
    |Lista de turmas|
    E eu devo ver os seguintes professores:
    |Lista de professores|

Cenário: Disciplina não possui turmas
    Então eu devo ver "Não há turmas cadastradas para essa disciplina"