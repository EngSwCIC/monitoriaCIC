# language: pt
Funcionalidade: Como usuário, desejo recuperar minha senha uma vez que eu tenha esquecido ou perdido ela.

  Cenário: Eu, enquanto Usuário, esqueci minha senha e clico no link para recuperá-la
    Dado que eu estou na página de login de usuários
    Quando eu clico em "Clique aqui"
    Então eu devo estar na página de recuperação de senha

  Cenário: Eu, enquanto Usuário, digito meu e-mail cadastrado e espero receber um e-mail para recuperar minha senha
    (happy path)
    Quando eu preencho o formulário com:
      | reset_senha[email]  | mrabobora@unb.br  |
    E clico em "Enviar"
    Então eu devo estar na página inicial do MonitoriaCIC
    E devo ver "As instruções para resetar sua senha foram enviadas para seu e-mail."

  Cenário: Eu, enquanto Usuário, digito um e-mail não cadastrado porque esqueci meu e-mail também (sad path)
    Quando eu preencho o formulário com:
      | reset_senha[email]  | abobrinhajr@unb.br  |
    E clico em "Enviar"
    Então eu devo estar na página de recuperação de senha
    E devo ver "Seu e-mail não foi encontrado."