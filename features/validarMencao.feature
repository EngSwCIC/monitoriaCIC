# language: pt
Funcionalidade: Como professor, consigo vizualizar as menções verídicos dos alunos que se inscreveram na monitoria 
da minha disciplina.

  Cenário de Fundo:
    Dado que o banco possui um aluno e um professor
    E que o banco possui um historico do aluno
    E que o banco possui a mencao informada pelo aluno
    
  Cenário: O aluno aplica para monitoria (remunerada ou voluntária) com a mencao verídica (Happy Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu informo minha mencao na disciplina e meu historico atualizado
    A mencao informada é a mesma que está no meu histórico
    Então a minha aplicação de monitoria tem a mencao válida.

  Cenário: O aluno aplica para a monitoria (remunerada ou voluntaria) com a mencao inferior a ms (Sad Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu informo minha mencao na disciplina e meu historico atualizado
    A mencao informada é inferior a ms
    Então a minha aplicação de monitoria é inválida.

  Cenário: O aluno aplica para a monitoria (remunerada ou voluntária) com a mencao incorreta (Sad Path)
    Quando eu estiver efetuando o processo de aplicação de monitoria
    Eu informo minha mencao na disciplina e meu historico atualizado
    A mencao informada difere da que está no meu histórico
    Então a minha aplicação de monitoria tem a mencao invalida.

        