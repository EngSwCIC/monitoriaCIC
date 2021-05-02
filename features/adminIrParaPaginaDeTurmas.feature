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
    Dado que a disciplina "Algoritmos e Programação de Computadores" existe
    E os seguintes professores existem:
    | Professor |
    E as seguintes turmas existem:
    |Turma de APC|
    Quando eu clico em "Ver Turmas" dentro de "Algoritmos e Programação de Computadores"
    Então eu devo estar na página da turma "Algoritmos e Programação de Computadores"

Cenário: Disciplina não possui turmas
    Dado que a disciplina "Algoritmos e Programação de Computadores" existe
    Quando eu clico em "Ver Turmas" dentro de "Algoritmos e Programação de Computadores"
    Então eu devo estar na página da turma "Algoritmos e Programação de Computadores"
    E eu devo ver "Não há turmas cadastradas para essa disciplina"