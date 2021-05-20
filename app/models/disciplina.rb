class Disciplina < ApplicationRecord
	
	##
	# Método estático que retorna os tipos das diciplinas
	#
	# Retorna o tipo da disciplina 
	#
	def self.all_tipos
    	return [['Obrigatória', 1], ['Optativa', 2]]
	end

	##
	# Método estático para achar todas as disciplinas
	#
	# Retorna uma lista de todas as disciplinas, ordenadas por nome
	#
	def self.all_disciplinas
		order(:nome).all
	end

	##
	# Método estático para achar todas as disciplinas que permitem monitoria
	#
	# Retorna uma lista de todas as disciplinas que possuem o campo monitoria como true
	#
	def self.com_monitoria
		return where(monitoria: true)

	end

 	validates_presence_of :nome
 	validates_presence_of :fk_tipo_disciplina_id
 	validates_presence_of :c_prat
 	validates_presence_of :c_teor
 	validates_presence_of :c_est
 	validates_presence_of :c_ext


 	validates :nome, format: { without: /[\d]+|['"!¹@²#³$£%¢¨¬&\*\(\)\-_\+=§`´\[\]{}\^~ªº°\?\/:;>.<,\|\\]+/, message: 'apenas letras e espaços'}
 	validates :c_prat, format: { with: /\A[\d]+\z/, message: "apenas numeros" }
 	validates :c_teor, format: { with: /\A[\d]+\z/, message: "apenas numeros" }
 	validates :c_est, format: { with: /\A[\d]+\z/, message: "apenas numeros" }
 	validates :c_ext, format: { with: /\A[\d]+\z/, message: "apenas numeros" }

end
