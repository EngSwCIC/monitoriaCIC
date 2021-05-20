#language: pt
  Funcionalidade: Alocacao de monitorias remunerada

  Cenário de Fundo: 
    Dado que o banco possui duas disciplinas
    E que o banco possui quatro turmas cadastradas
    E que o banco possui um adminstrador
    E que o banco possui monitorias pendentes cadastradas
    E que eu estou na página de login de usuários
    E que o "admin" está logado

  Cenário: Eu enquanto adiministrador, vou alocar as bolsas (Happy path)
    Dado que está na página de dashboard do usuário
    E clico em "Vagas de monitoria"
    E aperto em "Alocar"
    Então eu devo ver "Alunos alocados com sucesso!"

  Cenário: Eu enquanto administrador, tento alocar as bolsas após já serem alocadas (Sad path)
    Dado que está na página de dashboard do usuário
    E clico em "Vagas de monitoria"
    E aperto em "Alocar"
    E eu devo ver "Alunos alocados com sucesso!"
    E aperto em "Alocar" novamente
    Então eu devo ver "Não existe monitorias a serem alocadas, ou as monitorias já foram alocadas!"
