# language: pt
Funcionalidade: Monitor pode editar um atendimento seu já registrado
  O monitor acessa o sistema e é capaz de editar um atendimento feito por ele.

Cenário de Fundo:
  Dado que o banco possui uma disciplina
  E que o banco possui uma turma cadastrada
  E que o banco possui uma monitoria
  E que o "monitor" está logado
  E que eu estou na página de atendimentos
  E que o "monitor" possui uma atendimento registrado
  Quando eu clico em "Editar"
  Então eu devo estar na página de edição de atendimentos

Cenário: Monitor edita um atendimento (Happy Path)
  Quando o monitor preenche o formulário com:
  | Motivo                      | Motivo editado                          |         
  | Dia                         | Dia editado                             |
  | Descrição                   | Descrição editada                       |
  | Aluno_Atendido              | Aluno_Atendido editado                  |
  E aperta em "Atualizar atendimento"
  Então o monitor deve estar na página de atendimentos
  E o monitor deve ver "Atendimento was successfully updated."

Cenário: Monitor não completa o formulário com o id do motivo (Sad Path)
  Quando o monitor preenche o formulário com:
  | Motivo                      |                                         |
  | Dia                         | Dia editado                             |
  | Descrição                   | Descrição editada                       |
  | Aluno_Atendido              | Aluno_Atendido editado                  |                            
  E aperta em "Atualizar atendimento"
  Então o monitor deve estar na página de atendimentos
  E o monitor deve ver uma mensagem de erro informando "Campo obrigatório 'Motivo' não preenchido"
