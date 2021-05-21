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

	##
	# Método utilizado como auxílio no arquivo views/monitorias/edit.html.haml
	# Retorna um array com as opções possíveis para seleção de prioridade

	def self.all_prioridades
		return [['Selecionar', nil],['1', 1], ['2', 2], ['3', 3], ['4', 4], ['5', 5]]
 	end

	##
	# Método que calcula a média das prioridades de dois professores
	# Método chamado em callback before_update, sempre que um professor atualizar uma prioridade
	#
	# Se uma das prioridades for nula, isto é, não foi atribuida, a média representa a soma das prioridades
	# Senão, caso haja duas duas prioridades, a média é a média aritmética dessas prioridades

	def set_media
		prioridade = self.prioridade
		prioridade_auxiliar = self.prioridade_auxiliar
		media = self.media
		if !prioridade || !prioridade_auxiliar
			media = prioridade.to_f + prioridade_auxiliar.to_f
		else
 			media = (prioridade + prioridade_auxiliar)/2
		end
		self.media = media
	end

 	validates_presence_of :remuneracao
 	validates_presence_of :fk_matricula
 	validates_presence_of :fk_cod_disciplina
 	validates_presence_of :fk_turmas_id
 	validates_presence_of :fk_status_monitoria_id

 	
end
