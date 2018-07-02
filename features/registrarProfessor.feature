# language: pt
  Funcionalidade: Professor pode se registrar manualmente
    Um professor que acessa o sistema é capaz de se registrar manualmente

  Cenário de Fundo:
    Dado que eu estou na página inicial do MonitoriaCIC
    Quando eu clico em "aqui"
    Então estou na página de registro de professores

    Cenário: Professor se registra no sistema
      Quando eu preencho o formulário com:
        | Nome            | Genaina Nunes Rodrigues |
        | Username        | grodrigues              |
        | Email           | genaina@unb.br          |
        | Senha           | 12345678                |
        | Confirmar Senha | 12345678                |
      E eu escolho o "Professor(a) Adjunto(a)" do seletor "professor[role]"
      E aperto em "Registrar"
      Então eu devo ver "Registro realizado com sucesso!"

    Cenário: Professor tenta se registrar com informações inválidas
      Quando eu preencho o formulário com:
        | Nome            | |
        | Username        | |
        | Email           | |
        | Senha           | |
        | Confirmar Senha | |
      E eu aperto em "Registrar"
      Então eu devo ver as todas as mensagens de falha para registro de professores