# language: pt
Funcionalidade: Como professor, consigo vizualizar as Matrículas verídicas dos alunos que se inscreveram 
na monitoria da minha disciplina.

  Cenário de Fundo:
    Dado que o banco possui um aluno e um professor
    E que o banco possui um historico do aluno
    E que o banco possui a matricula informada pelo aluno

  Cenário: O aluno aplica para monitoria (remunerada ou voluntária) com uma matrícula verídica (Happy Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu informo minha matricula e meu historico atualizado
    A matricula informada é a mesma que está no meu histórico
    Então a minha aplicação de monitoria tem a matricula válida.

  Cenário: O aluno aplica para a monitoria (remunerada ou voluntária) com uma matrícula incorreta (Sad Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu informo minha matricula e meu historico atualizado
    A matricula informada difere da que consta no meu historico
    Então a minha aplicação de monitoria tem a matricula invalida.
        