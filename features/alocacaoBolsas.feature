  Funcionalidade: Alocação de monitorias remuneradas
	  Conforme a seleção semiautomática, alocação das vagas de monitorias remuneradas. 

	Cenário de Fundo: 
		Dado que o banco possui varias disciplinas.
		E que o banco possui varias turmas.
		E que possui um numero N de bolsas.
		E o "admin" está logado

	Cenário: Eu enquanto administrador, defino a quantidade de bolsas que serão alocadas (Happy path)
		Dado que serão alocadas novas bolsas.
		E o sistema faz a distribuição de uma bolsa por disciplina.
		E as bolsas remanescentes, são alocadas para as disciplinas com maior preferência.
		Então o programa alocou o mínimo de vaga por disciplina corretamente.
	
	Cenário: Eu enquanto administrador, defino a quantidade de bolsas que serão alocadas (Sad path)
		Dado que serão alocadas novas bolsas.
		E o numero de bolsas disponíveis é menor que o numero de disciplinas.
		Então o programa não conseguiu alocar as bolsas corretamente.
    
  Cenário: Eu enquanto administrador, defino a quantidade de bolsas que serão alocadas (Sad path)
    Dado que serão alocadas novas bolsas.
    E o sistema faz a distribuição mínima de bolsas por disciplina.
    E as bolsas remanescentes não foram alocadas para as disciplinas com maior preferência (indesejado).
    Então o programa não alocou as bolsas corretamente.
