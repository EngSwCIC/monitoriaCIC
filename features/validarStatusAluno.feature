# language: pt
Funcionalidade: Como professor, consigo vizualizar apenas os alunos que aplicaram para monitoria com status válido.


  Cenário de Fundo: 
    Dado que o banco possui um aluno e um professor
    E que o banco possui um historico do aluno

  Cenário: O aluno aplica para monitoria voluntária ou remunerada com status válido (Happy Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu envio o meu histórico atualizado
    O meu status que consta no histórico é "ATIVO"
    Então a minha aplicação de monitoria tem o status válido.

  Cenário: O aluno aplica para monitoria voluntária ou remunerada com status inválido (Sad Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu envio o meu histórico atualizado
    O meu status que consta no histórico é "INATIVO"
    Então a minha aplicação de monitoria tem o status inválido.
    