class Monitoria < ApplicationRecord

	require 'pdf-reader'

	# after_create :validate_historico

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
	

	# def self.validate_historico
	# 	#passar nome do arquivo, ou o arquivo em si
  #  	return self.scraping('historico_180112601.pdf', :fk_cod_disciplina)
  # end
 	
	def self.scraping(filename, disciplina)
    flagMatricula=0
    flagStatus=0
    flagIRA=2
    flagMencao=0
    matricula_doc=0
    status_doc=0
    ira_doc=0
    mencao_doc=0
    filename = Rails.root.join('app', 'models',filename).to_s 
    #le o historico
    PDF::Reader.open(filename) do |reader|
      reader.pages.each do |page|
        lines = page.text.scan(/^.+/)
        lines.each do |line|
          #adiquire a matricula a partir do historico
          if line.include?('Matrícula:')
            if flagMatricula == 0
              vet = line.split()
              matricula_doc = vet[7]
              flagMatricula = 1
            end
          end
          #adiquire o status a partir do historico
          if line.include?('Status:')
            if flagStatus == 0
              vet = line.split()
              status_doc = vet[1]
              flagStatus= 1
            end
          end
          #adiquire o IRA a partir do historico
          if line.include?('IRA')
            if flagIRA == 1
              vet = line.split()
              ira_doc = vet[1]
            end
            flagIRA = flagIRA - 1
            
          end
          #adiquire a mencao a partir do historico
          if line.include?(disciplina)
            if flagMencao == 0
              vet = line.split()
              mencao_doc = vet[-2]
              flagMencao = 1
            end
          end
        end
      end
    end
  end  
end  