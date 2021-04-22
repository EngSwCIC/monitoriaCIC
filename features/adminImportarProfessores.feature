# language: pt
Funcionalidade: Importar uma lista de professores importada do site SIGAA

    Enquanto administrador,
    Para adicionar professores pertencentes ao departamento CIC ao banco de dados,
    Eu quero importar uma lista de professores encontrados no site SIGAA.

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de importar professores

Cenário: Professores importados corretamente
    Dado que os seguintes professores existem no site SIGAA:
    |Incluir tabela aqui |

    Quando eu clico em "Importar professores"
    Então eu devo estar na página de importar professores
    E eu devo ver "Professores importados com sucesso!"
    E eu devo ver os seguintes professores:
    |Incluir tabela aqui |

Cenário: Há erro na formatação da página remota
    Dado que a página de professores no site remoto está formatada incorretamente
    Quando eu clico em "Importar professores"
    Então eu devo ver "Erro: Não foi possível importar professores"

Cenário: Professores já existentes no banco de dados
    Dado que os seguintes professores existem no site SIGAA:
    |Incluir tabela aqui |
    E os seguintes professores existem:
    |Mesma tabela |
    Quando eu clico em "Importar professores"
    Então eu devo estar na página de importar professores
    E eu devo ver "Aviso: Um ou mais professores já foram adicionados anteriormente"
    E eu devo ver os seguintes professores somente uma vez:
    |Incluir tabela aqui |