#language pt
  Funcionalidade: Como administrador consigo revisar as alocacoes de vagas de monitoria voluntaria.

  Cenario de Fundo:
    Dado que o banco possui uma disciplina.
    E que o banco possui alunos e professores.
    E que o banco possui uma turma.
    E que o banco possui vagas de monitoria voluntaria alocadas.
    E que o "admin" esta logado.
    
  Cenario: Eu enquanto administrador, quero revisar as vagas de monitoria voluntaria e chego na pagina desejada. (Happy path)
    Dado que eu apertei no botao "revisar vagas de monitoria".
    E que dentro da nova pagina filtrei por "monitorias voluntarias".
    E que existe a disciplina APC
    Entao consigo ver todas as vagas de monitoria voluntarias alocadas na disciplina APC
    E existe o botao aprovar nas linhas da disciplina APC
    E existe o botao reprovar nas linhas da disciplina APC

  Cenario: Eu enquanto administrador nao posso revisar se nao houverem alunos alocados na disciplina
    Dado que eu apertei no botao "revisar vagas de monitoria".
    E que dentro da nova pagina filtrei por "monitorias voluntarias".
    E que existe a disciplina ED
    Entao consigo ver que nao ha vagas de monitoria voluntarias alocadas na disciplina ED
    E nao existe o botao aprovar nas linhas da disciplina ED
    E nao existe o botao reprovar nas linhas da disciplina ED

