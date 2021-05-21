# language: pt
Funcionalidade: Um administrador pressiona um botão para enviar os emails das monitorias processadas

  Cenário de Fundo:
    Dado que o banco possui varias disciplinas.
    E que o banco possui varias turmas.
    E que o banco possui alunos e professores.
    E que o banco possui as monitorias processadas por aluno/turma.

  Cenário: Eu enquanto administrador, envio um email para cada aluno por monitoria confirmada (Happy path)
    Dado que o nome do professor e da turma estão na lista
    E que o aluno foi aceito para essa turma
    E que estou na página de processamento
    Quando eu apertar o botão "Enviar emails"
    Então o aluno receberá um email com as informações da turma confirmando a monitoria

  Cenário: Eu enquanto administrador, envio um email para cada aluno por monitoria recusada (Sad path)
    Dado que o nome do professor e da turma estão na lista
    E que o aluno foi recusado para essa turma
    E que estou na página de processamento
    Quando eu apertar o botão "Enviar emails"
    Então o aluno receberá um email com as informações da turma explicando que ele foi recusado para a monitoria
