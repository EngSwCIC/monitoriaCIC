##
# Monitoria
#
# Classe que engloba a monitoria extraída do banco de dados.
# Ela é responsável por conter as informações da monitoria e por enviar os emails corretos aos alunos e professores envolvidos.
#
class Monitoria < ApplicationRecord

    after_save :send_resultado_monitoria_user
    after_save :send_resultado_monitoria_prof

    ##
    # send_resultado_monitoria_user
    #
    # Método que manda o resultado da monitoria como email para o monitor inscrito.
    # Ele chama o monitoria_mailer com os parâmetros da monitoria para ele então gerenciar o envio de email.
    #
    # @param [Int] resultado Número extraído do banco de dados que estabelece se aluno foi aceito na monitoria.
    #
    def send_resultado_monitoria_user
      if (self.fk_status_monitoria_id == 3)
        MonitoriaMailer.with(resultado: self).send("resultado_monitoria_user", User.find_by_matricula(self.fk_matricula)).deliver_now!
      end
    end

    ##
    # send_resultado_monitoria_prof
    #
    # Método que manda o resultado da monitoria como email para o professor da matéria.
    # Ele chama o monitoria_mailer com os parâmetros da monitoria para ele então gerenciar o envio de email.
    #
    # @param [Int] resultado Número extraído do banco de dados que estabelece se aluno foi aceito na monitoria.
    #
    def send_resultado_monitoria_prof
      if (self.fk_status_monitoria_id == 3)
        MonitoriaMailer.with(resultado: self).send("resultado_monitoria_prof", Professor.find_by_name(Turma.find(self.fk_turmas_id).professor)).deliver_now!
      end
    end

  def self.all_disciplinas
     @disciplinas = Array.new
     Disciplina.find_each do |d|
       @disciplinas << [d.nome, d.cod_disciplina]
     end
     @disciplinas
   end

   # def self.all_turmas
   #   @turmas = Array.new
   #   Turma.find_each do |t|
   #       @turmas << [t.turma, t.id]
   #   end
   #   @turmas
   # end

   def self.all_status
      return [['Pendente', 1], ['Recusado', 2], ['Aceito', 3], ['Encerrado', 4]]
   end
   validates_presence_of :remuneracao
   validates_presence_of :fk_matricula
   validates_presence_of :fk_cod_disciplina
   validates_presence_of :fk_turmas_id
   validates_presence_of :fk_status_monitoria_id


end
