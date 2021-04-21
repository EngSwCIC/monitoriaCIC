# language: pt
Funcionalidade: Como professor, consigo vizualizar os IRAs verídicos dos alunos e maior ou igual a 3,5 , no caso de 
monitoria remunerada, que se inscreveram na monitoria da minha disciplina.

  Cenário de Fundo:
    Dado que o banco possui um aluno e um professor
    E que o banco possui um histórico do aluno
    E que o banco possui o IRA informado pelo aluno

  Cenário: O aluno aplica para monitoria voluntária com um IRA verídico (Happy Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu informo o meu IRA atual
    E envio o meu histórico atualizado
    O IRA informado é o mesmo que está no meu histórico
    Então a minha aplicação de monitoria tem o IRA válido.

  Cenário: O aluno aplica para monitoria remunerada com um IRA verídico e maior ou igual a 3,5 (Happy Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu informo o meu IRA atual
    E eu envio o meu histórico atualizado
    O IRA informado é o mesmo que está no meu histórico
    E o meu IRA é maior ou igual a 3,5
    Então a minha aplicação de monitoria tem o IRA válido.
