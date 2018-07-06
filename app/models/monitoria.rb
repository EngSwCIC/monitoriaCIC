class Monitoria < ApplicationRecord

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
    	return [['Pendente', 1], ['Recusado', 2], ['Aceito', 3]]
 	end
 	validates_presence_of :remuneracao
 	validates_presence_of :fk_matricula
 	validates_presence_of :fk_cod_disciplina
 	validates_presence_of :fk_turmas_id
 	validates_presence_of :fk_status_monitoria_id

 	
end
