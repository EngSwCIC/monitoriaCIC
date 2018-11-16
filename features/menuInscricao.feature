# language: pt
  Funcionalidade: Como primeiro acesso quero poder escolher me inscrever como aluno ou professor.

    Cenário de Fundo:
        Dado que eu estou na página inicial do MonitoriaCIC
        Quando eu clico em "Registrar"
        Então eu devo estar na página de escolha de registro
        Quando eu clico em "Inscrever como Aluno"
        Então eu devo estar na página de registro de alunos
        Quando eu clico em "Inscrever como Professor"
        Então eu devo estar na página de registro de professores

    Cenário: O usuário escolhe como vai se registrar (Happy path)
      