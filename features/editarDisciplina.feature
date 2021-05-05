
# language: pt

Épico: Coordenador pode selecionar as disciplinas e/ou turmas que podem ou não receber monitores 

Funcionalidade: Eu, como Coordenador, quero poder editar o status de disponibilidade de uma turma para a monitoria, para indicar para os alunos quais disciplinas podem receber monitor.

Cenário de Fundo:
    Dado que usuário está logado com o perfil de Coordenador
    E que o usuário está na página inicial de Coordenador

Cenário: O coordenador atualiza uma disciplina (happy path)
    Quando o usuário acessa o menu "Disciplinas"
    E aciona o botão "Editar Disciplina"
    Quando está na página de edição de disciplina
    E preenche os campos <nome>,<creditosPraticos>,<creditosTeoricos>,<creditosEst>,<creditosExt>,<tipo>,<monitoria>
    E envia o formulario para atualizar a disciplina
    Quando a disciplina é atualizada no sistema
    Então o usuário deve ver a mensagem "Disciplina atualizada!" na página de listagem de disciplinas.

    Exemplos:
    | nome | creditosPraticos  | creditosTeoricos  | creditosEst | creditosExt |     tipo         | monitoria |
    |  APC  |        6         |         6        |      6      |       6    |  Obrigatória     |  checked  |
    |  APC  |        6         |         6        |      6      |       6    |  Obrigatória     |  checked  |
    |  BD  |        6          |         6         |      6       |       6     |  Obrigatória      |  uncheked  |

Cenário: O coordenador atualiza o nome da disciplina com outra existente (sad path)
    Quando que o usuário acessa o menu "Disciplinas"
    E aciona o botão "Editar Disciplina"
    Quando está na página de edição de disciplina
    E preenche o campo nome com um <nome> já existente
    E envia o formulario para atualizar a disciplina
    Então a disciplina não é atualizada no sistema

    Exemplos:
        | nome |
        | APC  |