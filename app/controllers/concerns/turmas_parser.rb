# controllers/concerns/turmas_parser.rb

module TurmasParser
    extend ActiveSupport::Concern

    def parse_turmas_file (uploadedFile)
        docToParse = Nokogiri::HTML(uploadedFile.read) do |config|
            config.norecover
        end
        listaDeHashesDeTurmas = Array.new()
        blocosDeTurmaHTML = docToParse.xpath(
            '//componentescur[@class=\"#{class_name}\"]..') # Separa o html em blocos da table pai do tr de classe 'componentescur'
        blocosDeTurmaHTML.each do |t|
            turma = Hash.new()
            infoDisciplinaTurma = t.at_css('tr.componentescur').css('td')
            turma[:nomeDisciplina] = infoDisciplinaTurma[0].to_s.match(/^\s+\S+ - (.+)+ -/)
            turma[:codigoDisciplina] = infoDisciplinaTurma[0].to_s.match(/^\s+(\S+) -/)
            turma[:codigoTurma] = infoDisciplinaTurma[1].to_s.match(/^\s+(\S+)\s/)
            turma[:situacao] = infoDisciplinaTurma[2].to_s.match(/<td>\s+(.+?)\s+<\/td>/)

            infoProfessor = t.css('tr')[4].css('td') # Pulamos as quatro primeiras rows na tabela
            turma[:nomeProfessor1] = infoProfessor[0].css('i').to_s.match(/<i>(.+?) \(.+\)/)
            turma[:nomeProfessor2] = infoProfessor[0].css('i').to_s.match(/<br>(.+?) \(.+\)/) # Espera-se que seja = nil se houver só um professor
            turma[:reserva] = infoProfessor[1].css('i').to_s.match(/<i><?i?>?(.+?)\/?<\/i><?/)

            listaDeHashesDeTurmas.append(turma)
        end
        return listaDeHashesDeTurmas
    end

    def criar_professor_com_valores_padroes (nomeProfessor)
        nomeFormatado = nomeProfessor.split.map(&:capitalize).join(' ') # Transforme a primeira letra de cada nome em maiúscula
        usuarioPadrao = nomeFormatado.split.join('')[0...14]
        emailPadrao = usuarioPadrao + '@unb.br'
        senhaPadrao = '123456abc'
        role = 1
        Professor.create!(name: nomeFormatado, email: emailPadrao, username: usuarioPadrao, password: senhaPadrao, password_confirmation: senhaPadrao, role: role)
    end

    def criar_disciplina_com_valores_padroes (nome, codigo)
        Disciplina.create!([{nome: nome, 
            fk_tipo_disciplina_id: 1, c_prat: 0, c_teor: 0, 
            cod_disciplina: codigo}])
    end

    def criar_turma_a_partir_de_parametros (codigo, nomeDisciplina, nomeProfPrincipal, nomeProfAuxiliar)
        disciplinaId = Disciplina.find(nomeDisciplina).id
        Turma.create!([{
            fk_cod_disciplina: disciplinaId,
            turma: codigo,
            professor: nomeProfPrincipal,
            professor_aux: nomeProfAuxiliar,
            fk_vagas_id: 1
        }])
    end

end