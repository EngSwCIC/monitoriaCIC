# language: pt
Funcionalidade: Alocacao de monitorias remuneradas conforme a seleção semiautomática

  Cenário de Fundo:
    Dado que o banco possui um adminstrador
    E que eu estou na página de login de usuários
    E que o "admin" está logado

  Cenário: Eu enquanto administrador, defino a quantidade de monitores para uma disciplina (Happy path)
    Dado que o numero de vagas de monitoria remunerada alocadas é menor que o numero de monitores para a disciplina
    E o sistema faz a alocacao de vagas de monitoria voluntaria
    E o numero de alunos incritos para monitoria voluntaria é superior  a subtracao do numero de monitores para a disciplina pelo numero de vagas de monitoria remunerada alocadas
    Então o numero de  vagas de monitoria volutaria alocadas para a disciplina igual a diferença da quantidade de monitores e o numero de vagas de monitoria remunerada alocadas

  Cenário: Eu enquanto administrador, defino a quantidade de monitores para uma disciplina (Sad path)
    Dado que o numero de vagas de monitoria remunerada alocadas é menor que o numero de monitores para a disciplina
    E o sistema faz a alocacao de vagas de monitoria voluntaria
    E o numero de alunos incritos para monitoria voluntaria é inferior  a subtracao do numero de monitores para a disciplina pelo numero de vagas de monitoria remunerada alocadas
    Então o numero de  vagas de monitoria volutaria alocadas para a disciplina menor que a diferença da quantidade de monitores e o numero de vagas de monitoria remunerada alocadas

