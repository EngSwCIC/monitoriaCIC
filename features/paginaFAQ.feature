# language: pt
  Funcionalidade: acessar a página de FAQ (Frequent Asked Questions) do sistmea
    O usuário consegue acessar a página de FAQ para tirar duvidas sobre a utilização do sistema

  Cenário de Fundo:
    Dado que eu estou na página inicial do MonitoriaCIC
    Quando eu clico em "FAQ"
    Então estou na página de FAQ

    Cenário:
      Quando eu clicar em uma pergunta
      Então eu devo ver "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id ante nunc. Maecenas semper, orci eget volutpat suscipit, erat quam consectetur urna, eu porttitor sem risus eu ligula. Duis pulvinar augue non justo sagittis consequat. Etiam non odio eu magna rhoncus gravida."