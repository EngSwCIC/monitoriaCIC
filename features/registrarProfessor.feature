# language: pt
  Funcionalidade: Professor pode se registrar manualmente
    Um professor que acessa o sistema é capaz de se registrar manualmente

  Cenário de Fundo:
    Dado que eu estou na página inicial do MonitoriaCIC
    Quando eu clico em "aqui"
    Então estou na página de registro de professores

    Cenário: Professor se registra no sistema
      Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            | Genaina Nunes Rodrigues |
        | Username        | grodrigues              |
        | Email           | genaina@unb.br          |
        | Senha           | 12345678                |
        | Confirmar Senha | 12345678                |
      E eu escolho o "Professor(a) Adjunto(a)" do seletor "professor[role]"
      E clico em "Registrar"
      Então estou na página de dashboard do usuário
      E eu devo ver "Registro realizado com sucesso!"