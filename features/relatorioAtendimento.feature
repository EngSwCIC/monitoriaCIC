#language pt
Funcionalidade: Relatorio dos atendimentos
    O monitor pode accesar a seu relatorio de atendimentos e os professores podem accesar aos relatorios de todos os monitores


Cenario de Fundo:
    Dado que eu estou na pagina de x(accesso de relatorios)
    Quando eu clico em "Visualizar relatorio"
    Entao eu devo estar na pagina dos relatorios

Cenario:Monitor visualiza todos os registros(Happy Path)
    Quando o monitor visualiza o relatorio
        |Aluno atendido|Dia        |Motivo  |Descricao|
        |Daniel        |08/10/2019 |duvida  |tirar uma duvida|
        |Sergio        |17/11/2019 |consulta|consulta monitor|
    
    E quando ele clica em registro especifico 
    Entao o monitor deve estar na pagina do registro selecionado
    E o monitor deve ver as informacoes completas do registro
    E ele pode editar ou excluir o registro de atendimento
    
Cenario: Professor pode visualizar o relatorio especifico (Happy Path)
    Quando professor escolhe um relatorio especifico para visualizar
    Entao  professor visualiza o relatorio do monitor 
        |Aluno atendido|Dia        |Motivo  |Descricao|
        |Daniel        |08/10/2019 |duvida  |tirar uma duvida|
        |Sergio        |17/11/2019 |consulta|consulta monitor|
    
Cenario: Professor seleciona um relatorio especifico(Sad Path )
    Quando professor escolhe um relatorio inexistente do monitor 
    E o professor aperta em visualizar
    Entao o professor deve ficar na mesma pagina 
    E deve aparecer uma mensagem de erro falando que nao existe o relatorio 