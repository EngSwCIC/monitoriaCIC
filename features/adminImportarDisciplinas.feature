# language: pt
Funcionalidade: Importar uma lista de disciplinas do site SIGAA

    Enquanto administrador,
    Para adicionar disciplinas pertencentes ao departamento CIC ao banco de dados,
    Eu quero importar uma lista de disciplinas a partir de uma página Html.

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de importar disciplinas

Cenário: Disciplinas importadas corretamente
    Dado que eu coloco o arquivo "turmas_test_happy.html" no campo "arquivo_turmas"
    Quando eu clico em "Importar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E eu devo ver "Disciplinas importadas com sucesso!"
    E eu devo ver as seguintes disciplinas:
    |Incluir tabela aqui |

Cenário: Há erro na formatação da página remota
    Dado que eu coloco o arquivo "turmas_test_sad.html" no campo "arquivo_turmas"
    Quando eu clico em "Importar disciplinas"
    Então eu devo ver "Erro: Erro de formatação"

Cenário: Disciplinas já existem
    Dado que as seguintes disciplinas existem:
    | Disciplinas|
    E eu coloco o arquivo "tumas_test_happy.hmtl" no campo "arquivo_turmas"
    Quando eu clico em "Importar disciplinas"
    Então eu devo estar na página de importar disciplinas
    E eu devo ver "Aviso: Uma ou mais disciplinas já estão presentes no banco de dados"
    E eu devo ver as seguintes disciplinas somente uma vez:
    |Incluir tabela aqui |