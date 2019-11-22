class Atividade < ApplicationRecord

  ## Verifica se o formulário foi preenchido de acordo com a especificação
  validates_presence_of :titulo, message: "Campo obrigatório 'Título' não preenchido! Registro não realizado."
  validates_presence_of :mensagem, message: "Campo obrigatório 'Descrição' não preenchido! Registro não realizado."
  validates_presence_of :data, message: "Campo obrigatório 'Data' não preenchido! Registro não realizado."
  validates_presence_of :matricula_monitor, message: "Campo obrigatório 'Matrícula' não preenchido! Registro não realizado."
end
