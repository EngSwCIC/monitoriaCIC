# language: pt
  Funcionalidade: Aluno pode se registrar manualmente
    O usuário acessa o sistema e é capaz de realizar uma ação de login.

  Cenário de Fundo:
    Dado que eu estou na pagina inicial do MonitoriaCIC

    Cenário: Aluno se registra no sistema (Happy Path)
      Quando eu preencho o formulário de cadastro com informações válidas:
        | Nome            | Bernardo Costa Nascimento |
        | Matrícula       | 140080279                 |
        | Email           | bernardoc1104@gmail.com   |
        | CPF             | 01234567890               |
        | RG              | 1234567                   |
        | Senha           | 12345678                  |
        | Confirmar Senha | 12345678                  |
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - Nome)
      Quando eu preencho o formulário de cadastro com o campo "Nome" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro não pôde ser realizado."

    Cenário: Aluno não completa o registro (Sad Path - Email)
      Quando eu preencho o formulário de cadastro com o campo "Email" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro não pôde ser realizado."

    Cenário: Aluno não completa o registro (Sad Path - Matrícula)
      Quando eu preencho o formulário de cadastro com o campo "Matrícula" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro não pôde ser realizado."

    Cenário: Aluno não completa o registro (Sad Path - CPF)
      Quando eu preencho o formulário de cadastro com o campo "CPF" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro não pôde ser realizado."

    Cenário: Aluno não completa o registro (Sad Path - RG)
      Quando eu preencho o formulário de cadastro com o campo "RG" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro não pôde ser realizado."

    Cenário: Aluno não completa o registro (Sad Path - Senha)
      Quando eu preencho o formulário de cadastro com o campo "Senha" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro não pôde ser realizado."

    Cenário: Aluno não completa o registro (Sad Path - Confirmar Senha)
      Quando eu preencho o formulário de cadastro com o campo "Confirmar Senha" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na pagina inicial do MonitoriaCIC
      E eu devo ver "Registro não pôde ser realizado."