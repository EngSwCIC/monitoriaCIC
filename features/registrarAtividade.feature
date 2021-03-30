# language: pt
Funcionalidade: Monitor pode registrar uma atividade
  O monitor acessa o sistema e é capaz de registrar uma atividade feita por ele.

Cenário de Fundo:
  Dado que o banco possui uma disciplina
  E que o banco possui um aluno e um professor
  E que o banco possui uma turma cadastrada
  E que o banco possui uma monitoria
  E que o "aluno" está logado
  E que eu estou na página de atividade
  Quando eu clico em "Registrar"
  Então eu devo estar na página de registro de atividades

Cenário: Monitor registra uma atividade (Happy Path)
  Quando o monitor preenche o formulário com:
  | Título                      | Aula de Revisão                                |
  | Descrição                   | Resumo do conteúdo que cairá na terceira prova |
  | Dia                         | 21/11/2019                                     |
  | Matricula                   | 140080279                                      |
  E aperta em "Registrar-se"
  Então o monitor deve estar na página de atividades
  E o monitor deve ver "Registro realizado com sucesso!"

Cenário: Monitor não completa o formulário com os campos obrigatórios (Sad Path)
  Quando o monitor preenche o formulário com:
  | Título                      | Aula de Revisão                                |
  | Descrição                   | Resumo do conteúdo que cairá na terceira prova |
  | Dia                         |                                                |
  | Matricula                   | 140080279                                      |
  E o monitor aperta em "Registrar-se"
  Então o monitor deve estar na página de atividades
  E o monitor deve ver uma mensagem de erro informando "Campo obrigatório 'Data' não preenchido! Registro não realizado"
