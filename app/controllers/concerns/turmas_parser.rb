# controllers/concerns/turmas_parser.rb

module TurmasParser
    extend ActiveSupport::Concern

    def parse_turmas_file (uploadedFile)
        docToParse = Nokogiri::HTML(uploadedFile.read, nil, 'UTF-8') do |config|
            config.recover
        end
        listaDeHashesDeTurmas = Array.new()
        blocosDeTurmaHTML = docToParse.xpath(
            '//table[tr[@class="componentescur"]]') # Separa o html em blocos da table pai do tr de classe 'componentescur'
        blocosDeTurmaHTML.each do |t|
            turma = Hash.new()
            infoDisciplinaTurma = t.at_css('tr.componentescur').css('td')
            turma[:disciplina] = infoDisciplinaTurma[0].to_s.match(/^\s+\S+ - (.+)+ -/)[1]
            turma[:cod_disciplina] = infoDisciplinaTurma[0].to_s.match(/^\s+CIC(\S+) -/)[1].to_i
            turma[:codigo_turma] = infoDisciplinaTurma[1].to_s.match(/^\s+(\S+)\s/)[1]
            turma[:situacao] = infoDisciplinaTurma[2].to_s.match(/<td>\s+(.+?)\s+<\/td>/)[1]
            # puts 'DEBUG   ' + turma[:nomeDisciplina] + ' ' + turma[:cod_disciplina] + ' ' + turma[:codigoTurma] + ' ' + turma[:situacao]
    
            infoProfessor = t.at_css('tr.componentescur').next_element.css('td') # Pulamos as quatro primeiras rows na tabela
            turma[:prof_principal] = infoProfessor[0].css('i').to_s.match(/<i>(.+?) \(.+\)/)
            if (turma[:prof_principal] == nil)
              turma[:prof_principal] = ''
            else
              turma[:prof_principal] = turma[:prof_principal][1]
            end
            turma[:prof_auxiliar] = infoProfessor[0].css('i').to_s.match(/<br>(.+?) \(.+\)/) # Espera-se que seja = nil se houver só um professor
            if (turma[:prof_auxiliar] == nil)
              turma[:prof_auxiliar] = ''
            else
              turma[:prof_auxiliar] = turma[:prof_auxiliar][1]
            end
            turma[:reserva] = infoProfessor[1].css('i').to_s.match(/<i><?i?>?(.+?)\/?<\/i><?/)[1]
            listaDeHashesDeTurmas.append(turma)
        end
        return listaDeHashesDeTurmas
    end

    def criar_registros_a_partir_de_info_importada(lista_de_turmas)
        lista_de_turmas.each do |hash|
            Professor.criar_professor_com_valores_padroes(hash[:prof_principal])
            Professor.criar_professor_com_valores_padroes(hash[:prof_auxiliar])
            Disciplina.criar_disciplina_com_valores_padroes(hash)
            Turma.criar_turma_a_partir_de_parametros(hash)
        end
    end

end