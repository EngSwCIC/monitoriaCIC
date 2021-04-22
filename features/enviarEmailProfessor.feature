# language: pt
Funcionalidade: Um administrador pressiona um botão para enviar os emails das monitorias processadas

  Cenário de Fundo:
    Dado que o banco possui varias disciplinas.
    E que o banco possui varias turmas.
    E que o banco possui alunos e professores.
    E que o banco possui as monitorias processadas por aluno/turma.

  Cenário: Eu enquanto administrador, envio um email para cada professor por turma ministrada (Happy path)
    Dado que o nome do professor e da turma estão na lista
    E que um ou vários alunos foram processados para essa turma
    E que estou na página de processamento
    Quando eu apertar o botão "Enviar emails"
    Então o professor daquela turma receberá um email com as informações da turma e de cada aluno

  Cenário: Eu enquanto administrador, envio um email para cada professor por turma ministrada (Sad path)
    Dado que o nome do professor e da turma estão na lista
    E que nenhum aluno foi processao para essa turma
    E que estou na página de processamento
    Quando eu apertar o botão "Enviar emails"
    Então o professor daquela turma receberá um email explicando que não houve candidatos aptos para preencher as vagas de monitoria
