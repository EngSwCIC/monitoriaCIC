# language: pt
Funcionalidade: O professor é capaz de selecionar seu nome em uma lista (dropdown), e receber um e-mail



  Cenário: Eu, enquanto professor, sou capaz de receber um e-mail de confirmação
  (happy path)
    Dado que meu nome esta na lista
    E que eu estou na página de selecao de professores
    Quando eu selecionar o "Genaina Nunes Rodrigues" do seletor "professor[name]"
    Quando eu aperto em "Registrar-se"
    Então o usuario deve receber um email de confirmação

  Cenário: Eu, enquanto professor, sou capaz de receber um e-mail de confirmação
  (sad path)
    Dado que meu nome esta na lista
    E que eu estou na página de selecao de professores
    Quando eu escolho o " " do seletor "professor[name]"
    Quando eu aperto em "Registrar-se"
    Então o usuario não deve receber um email de confirmação