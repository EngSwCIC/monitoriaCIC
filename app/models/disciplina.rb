class Disciplina < ApplicationRecord
	def self.all_tipos
    	return [['Obrigatória', 1], ['Optativa', 2]]
	end

	def self.all_disciplinas
		order(:nome).all
	end

 	validates_presence_of :nome
 	validates_presence_of :fk_tipo_disciplina_id
 	validates_presence_of :c_prat
 	validates_presence_of :c_teor
 	validates_presence_of :c_est
 	validates_presence_of :c_ext
	validates_uniqueness_of :nome
	validates_uniqueness_of :cod_disciplina


 	validates :nome, format: { without: /['"!¹@²#³$£%¢¨¬&\*\(\)\-_\+=§`´\[\]{}\^~ªº°\?\/:;>.<,\|\\]+/, message: 'apenas letras, números e espaços'}
 	validates :c_prat, format: { with: /\A[\d]+\z/, message: "apenas numeros" }
 	validates :c_teor, format: { with: /\A[\d]+\z/, message: "apenas numeros" }
 	validates :c_est, format: { with: /\A[\d]+\z/, message: "apenas numeros" }
 	validates :c_ext, format: { with: /\A[\d]+\z/, message: "apenas numeros" }

end
