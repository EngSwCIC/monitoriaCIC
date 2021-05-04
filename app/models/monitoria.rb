class Monitoria < ApplicationRecord

	before_update :set_media

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

	def self.all_prioridades
		return [['1', 1], ['2', 2], ['3', 3], ['4', 4], ['5', 5]]
 	end

	def set_media
		if self.prioridade != nil
			self.media = self.prioridade
		elsif self.prioridade == nil && self.prioridade_auxiliar != nil
				self.media = self.prioridade_auxiliar 
		elsif self.prioridade_auxiliar != nil && self.prioridade != nil
 			self.media = (self.prioridade + self.prioridade_auxiliar)/2
		end
		# save!
	end

 	validates_presence_of :remuneracao
 	validates_presence_of :fk_matricula
 	validates_presence_of :fk_cod_disciplina
 	validates_presence_of :fk_turmas_id
 	validates_presence_of :fk_status_monitoria_id

 	
end
