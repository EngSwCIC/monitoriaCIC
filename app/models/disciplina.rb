class Disciplina < ApplicationRecord
	def self.all_tipos
    	return [['Obrigatória', 1], ['Optativa', 2]]
 	end

end
