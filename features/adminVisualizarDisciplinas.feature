# language: pt
Funcionalidade: Mostrar uma lista de disciplinas importada do site SIGAA

    Enquanto administrador,
    Para consultar as disciplinas existentes no curso,
    Eu quero visualizar uma lista de disciplinas encontradas no site SIGAA.

Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que o "admin" está logado
    E que eu estou na página de importar disciplinas

Cenário: Disciplinas importadas corretamente
    Dado que as seguintes disciplinas existem no site SIGAA:
    |Incluir tabela de disciplinas aqui depois |

    Quando eu clico em "Importar disciplinas"
    Então eu devo estar na página de escolha de disciplinas importadas
    E eu devo ver "Disciplinas importadas com sucesso!"
    E eu devo ver as seguintes disciplinas:
    |Incluir tabela de disciplinas aqui depois |

Cenário: Há erro na formatação da página remota
    Dado que a página de disciplinas no site remoto está formatada incorretamente
    Quando eu clico em "Importar disciplinas"
    Então eu devo ver "Erro: Não foi possível importar disciplinas"