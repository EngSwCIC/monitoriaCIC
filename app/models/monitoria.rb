# Aqui está a monitoria
class Monitoria < ApplicationRecord

	require 'pdf-reader'


	def self.all_disciplinas
 		@disciplinas = Array.new
 		Disciplina.find_each do |disp|
 			@disciplinas << [disp.nome, disp.cod_disciplina]
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
	
  ##
  # O metodo scraping faz a raspagem dos dados do historico (status, ira, mencao e matricula) 
  # 
  # Recebe como argumentos o nome do arquivo do historico e o codigo da disciplina a ser avaliada
  #
  # Retorna o resultado retornado pela funcao validacao
 	
	def scraping(filename, disciplina)
    filename = Rails.root.join('app', 'models',filename).to_s 
    #le o historico
    linhas_uteis = []
    PDF::Reader.open(filename) do |reader|
      reader.pages.each do |page|
        lines = page.text.scan(/^.+/)
        lines.each do |line|
          if line.include?('Matrícula:') or line.include?('Status:') or line.include?('IRA:') or line.include?(disciplina)
            linhas_uteis.append(line.split())
          end
        end
      end
    end

    status_doc = linhas_uteis[1][1]

    #validacao status
    if status_doc != "ATIVO"
      self.update(fk_status_monitoria_id: 2)
      return 'Recusado pelo status'
    end 

    return validacao(linhas_uteis)
  end
    
  ##
  # O metodo validacao e invocado pelo metodo historico e valida as informacoes extraidas do historico
  # 
  # Recebe as linhas do historico que contem os dados a serem validados
  #
  # Retorna uma string que especifica se o aluno pode ser aceito ou se este foi recusado por
  #
  # alguma irregularidade dos dados de seu historico

  def validacao(linhas_uteis)
    matricula_doc = linhas_uteis[0][-1]
    ira_doc = linhas_uteis[3][-3]
    mencao_doc = linhas_uteis[4][-2]

    self.update(fk_status_monitoria_id: 2)

    #validacao de matricula
    if matricula_doc.length != 9 or matricula_doc != "#{matricula_doc.to_i}"
      return 'Recusado pela matricula'
    end

    #validacao de mencao
    if mencao_doc  != "SS" and mencao_doc != "MS" 
      return 'Recusado pela mencao'
    end

    #validacao IRA
    num_ira = ira_doc.to_f
    if num_ira < 0 or num_ira > 5
      return 'Recusado pelo IRA'
    end
    if(self.remuneracao == 'Remunerado' and num_ira < 3.5)
      return 'Recusado pelo IRA para monitoria remunerada'
    end

    self.update(fk_status_monitoria_id: 3)
    return "Aceito"
    
  end
end
  