# language: pt
  Funcionalidade: Aluno pode se registrar manualmente
    O aluno acessa o sistema e é capaz de realizar uma ação de sign up.

  Cenário de Fundo:
    Dado que eu estou na página inicial do MonitoriaCIC
    Quando eu clico em "Registrar"
    Então eu devo estar na página de registro de alunos

    Cenário: Aluno se registra no sistema (Happy Path)
      Quando eu preencho o formulário com:
        | Nome            |Bernardo Costa Nascimento|
        | Matrícula       |140080279                |
        | Email           |bernardoc1104@gmail.com  |
        | CPF             |03638481182              |
        | RG              |2645178                  |
        | Senha           |12345678                 |
        | Confirmar Senha |12345678                 |
      E eu aperto em "Registrar-se"
      Então eu devo estar na página de dashboard do usuário
      E eu devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - Nome)
      Quando eu preencho o formulário de cadastro com o campo "Nome" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na página de registro de alunos
      E eu não devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - Email)
      Quando eu preencho o formulário de cadastro com o campo "Email" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na página de registro de alunos
      E eu não devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - Matrícula)
      Quando eu preencho o formulário de cadastro com o campo "Matrícula" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na página de registro de alunos
      E eu não devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - CPF)
      Quando eu preencho o formulário de cadastro com o campo "CPF" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na página de registro de alunos
      E eu não devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - RG)
      Quando eu preencho o formulário de cadastro com o campo "RG" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na página de registro de alunos
      E eu não devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - Senha)
      Quando eu preencho o formulário de cadastro com o campo "Senha" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na página de registro de alunos
      E eu não devo ver "Registro realizado com sucesso!"

    Cenário: Aluno não completa o registro (Sad Path - Confirmar Senha)
      Quando eu preencho o formulário de cadastro com o campo "Confirmar Senha" inválido:
      E eu clico em "Registrar"
      Então eu devo estar na página de registro de alunos
      E eu não devo ver "Registro realizado com sucesso!"