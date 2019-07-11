# language: pt
Funcionalidade: O professor é capaz de selecionar seu nome em uma lista (dropdown), e preparar um envio de e-mail.



  Cenário: Eu, enquanto professor, sou capaz de selecionar meu nome em uma lista
  (happy path)
    Dado que meu nome esta na lista
    E que eu estou na página de selecao de professores
    Quando eu escolho o "Genaina Nunes Rodrigues" do seletor "professor[name]"
    Quando eu aperto em "Registrar-se"
    Então eu devo estar na página de confirmacao dos professores

  Cenário: Eu, enquanto professor, sou capaz de selecionar meu nome em uma lista
  (sad path)
    Dado que meu nome esta na lista
    E que eu estou na página de selecao de professores
    Quando eu escolho o " " do seletor "professor[name]"
    Quando eu aperto em "Registrar-se"
    Então eu não devo ver "UM E-MAIL FOI ENVIADO PARA genaina@unb.br"