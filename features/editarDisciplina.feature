# language: pt
# Dado que usuário está logado com o perfil de Coordenador

Funcionalidade: Eu, como Coordenador, quero poder editar o status de disponibilidade de uma turma para a monitoria, para indicar para os alunos quais disciplinas podem receber monitor.

    Cenário de Fundo:
        Dado que o "admin" está logado
        E eu estou na página de "dashboard" do usuário
        # E que o admin está na página inicial de Coordenador

    Cenário: O coordenador atualiza uma disciplina (happy path)
        Quando o usuário acessa o menu "Disciplinas"
        E aciona o botão "Editar Disciplina"
        Quando está na página de edição de disciplina
        E preenche os campo <monitoria>
        E envia o formulario para atualizar a disciplina
        Quando a disciplina é atualizada no sistema
        Então o usuário deve ver a mensagem "Disciplina atualizada!" na página de listagem de disciplinas.

    Exemplos:
    | nome | creditosPraticos  | creditosTeoricos | creditosEst | creditosExt |     tipo         | monitoria |
    |  APC  |        6         |         6        |      6      |       6    |  Obrigatória     |  checked  |
    |  APC  |        6         |         6        |      6      |       6    |  Obrigatória     |  checked  |
    |  BD  |        6          |         6        |      6      |       6    |  Obrigatória      |  uncheked  |