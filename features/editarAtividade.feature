# language: pt
Funcionalidade: Monitor pode editar uma atividade sua já registrada
  O monitor acessa o sistema e é capaz de editar uma atividade feita por ele.

Cenário de Fundo:
  Dado que o banco possui uma disciplina
  E que o banco possui uma turma cadastrada
  E que o banco possui uma monitoria
  E que o "monitor" está logado
  E que eu estou na página de atividade
  E que o "monitor" possui uma atividade registrada
  Quando eu clico em "Editar"
  Então eu devo estar na página de edição de atividades

Cenário: Monitor edita uma atividade (Happy Path)
  Quando o monitor preenche o formulário com:
  | Título                      | Titulo editado                                |
  | Descrição                   | Descrição editada                             |
  E aperta em "Atualizar atividade"
  Então o monitor deve estar na página de atividades
  E o monitor deve ver "Atividade atualizada com sucesso!"

Cenário: Monitor não completa o formulário com os campos obrigatórios (Sad Path)
  Quando o monitor preenche o formulário com:
  | Título                      |                                               |
  | Descrição                   | Descrição editada                             |
  E aperta em "Atualizar atividade"
  Então o monitor deve estar na página de atividades
  E o monitor deve ver uma mensagem de erro informando "Campo obrigatório 'Titulo' não preenchido! Registro não realizado"
