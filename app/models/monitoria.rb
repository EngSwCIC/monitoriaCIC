class Monitoria < ApplicationRecord

    after_save :send_resultado_monitoria_user
    after_save :send_resultado_monitoria_prof
    
    def send_resultado_monitoria_user
    	if(self.fk_status_monitoria_id == 3)
    		MonitoriaMailer.with(resultado: self).resultado_monitoria_user.deliver_now!
    	end
    end
    
    def send_resultado_monitoria_prof
    	if(self.fk_status_monitoria_id == 3)
    		MonitoriaMailer.with(resultado: self).resultado_monitoria_prof.deliver_now!
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
 	# 	@turmas = Array.new
 	# 	Turma.find_each do |t|
 	# 			@turmas << [t.turma, t.id]
 	# 	end
 	# 	@turmas
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
