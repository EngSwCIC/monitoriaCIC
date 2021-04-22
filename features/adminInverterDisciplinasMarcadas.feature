# language: pt
Funcionalidade: Inverter marcação das caixas na página de importação de disciplinas

    Enquanto administrador,
    Para selecionar todas as disciplinas importadas não marcadas no momento,
    Eu quero apertar um botão para inverter a marcação das caixas de disciplinas

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de escolha de disciplinas importadas
    E eu importei as seguintes disciplinas:
    |Incluir tabela de disciplinas aqui depois |

Cenário: Inverter marcação das disciplinas
    Quando eu marco as caixas das seguintes disciplinas:
    | Disciplinas a serem marcadas|
    E eu clico em "Inverter"
    Então as seguintes disciplinas devem estar marcadas:
    | Disciplinas previamente não marcadas |
    E as seguintes disciplinas NÃO devem estar marcadas:
    | Disciplinas previamente marcadas|

Cenário: Clicar em "Inverter" sem nenhuma disciplina selecionada
    Quando eu clico em "Inverter"
    Então as seguintes disciplinas devem estar marcadas:
    | Todas as disciplinas disponíveis |
