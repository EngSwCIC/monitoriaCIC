# language: pt
Funcionalidade: Adicionar todas as disciplinas importadas do site de matrícula ao banco de dados

    Enquanto administrador,
    Para incluir todas as disciplinas importadas no banco de dados de forma definitiva,
    Eu quero usar uma caixa para marcar todas as disciplinas

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de escolha de disciplinas importadas
    E eu importei as seguintes disciplinas:
    |Incluir tabela de disciplinas aqui depois |

Cenário: Adicionar todas as disciplinas
    Quando eu marco a caixa "Todas"
    E eu clico em "Adicionar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E eu devo ver "Disciplina(s) adicionada(s) com sucesso!"
    E eu devo ver as seguintes disciplinas:
    |Todas as disciplinas importadas do site remoto |