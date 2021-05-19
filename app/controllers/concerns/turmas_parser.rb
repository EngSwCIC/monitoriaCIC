# controllers/concerns/turmas_parser.rb

##
# Implementa funções dedicadas à extração de dados de turmas de um arquivo importado.
# Este módulo serve apenas para uma formatação específica. Se o formato do arquivo for alterado, o módulo também deve ser.
module TurmasParser
    extend ActiveSupport::Concern

    ##
    # Usa funções da gema Nokogiri para separar o arquivo html em +file+ em blocos
    # menores, em cada qual deve estar contida informação sobre uma única turma.
    # Retorna uma lista de tais blocos.
    def parsear_arquivo_de_turmas (file)
        doc_to_parse = Nokogiri::HTML(file.read, nil, 'UTF-8') do |config|
            config.recover
        end
        blocos_de_turma_html = doc_to_parse.xpath(
            '//table[tr[@class="componentescur"]]') # Separa o html em blocos da table pai do tr de classe 'componentescur'
        return blocos_de_turma_html
    end

    ##
    # Retorna o primeiro casamento de texto encontrado no +bloco+, utilizando o parâmetro +regex+ passado.
    def extrair_texto_de_bloco (bloco, regex)
        return bloco.to_s.match(/#{regex}/)[1]
    end

    ##
    # Recebe um bloco html em +info_turma+, subdivide-o e extrai informações referentes a uma disciplina,
    # utilizando casamento de regex específicos. Para isso, utiliza-se a função +extrair_texto_de_bloco+.
    # Retorna uma hash com as informações.
    def extrair_info_de_disciplina (info_turma)
        info = Hash.new()
        info_disciplina = info_turma.at_css('tr.componentescur').css('td')
        info[:disciplina] = extrair_texto_de_bloco(info_disciplina[0], '^\s+\S+ - (.+)+ -')
        info[:cod_disciplina] = extrair_texto_de_bloco(info_disciplina[0], '^\s+CIC(\S+) -').to_i
        info[:codigo_turma] = extrair_texto_de_bloco(info_disciplina[1], '^\s+(\S+)\s')
        info[:situacao] = extrair_texto_de_bloco(info_disciplina[2], '<td>\s+(.+?)\s+<\/td>')
        return info
    end

    ##
    # Recebe um bloco html em +info_professor+, utiliza o padrão +regex+ passado para realizar casamento.
    # Caso haja casamento, retorna a primeira instância. Caso não, retorna um objeto nil.
    def buscar_nome_do_professor (info_professor, regex)
        professor = info_professor[0].css('i').to_s.match(/#{regex}/)
        if (professor != nil)
            professor = professor[1] # Caso haja match, usamos a senteça que causou o primeiro match, a qual fica no índice 1 do objeto MatchData.
        end
        return professor
    end

    ##
    # Recebe um bloco html em +info_turma+, utiliza a função +buscar_nome_do_professor+ para extrair informações.
    # Retorna uma hash com as informações.
    def extrair_info_de_professor (info_turma)
        info = Hash.new()
        info_professor = info_turma.at_css('tr.componentescur').next_element.css('td') # Pulamos as quatro primeiras rows na tabela
        info[:prof_principal] = buscar_nome_do_professor(info_professor, '<i>(.+?) \(.+\)')
        info[:prof_auxiliar] = buscar_nome_do_professor(info_professor, '<br>(.+?) \(.+\)')
        info[:reserva] = info_professor[1].css('i').to_s.match(/<i><?i?>?(.+?)\/?<\/i><?/)[1]
        #turma[:prof_auxiliar] = infoProfessor[0].css('i').to_s.match(/<br>(.+?) \(.+\)/) # Espera-se que seja = nil se houver só um professor
        return info
    end

    ##
    # Recebe uma lista de blocos, +blocos_de_turma+, contendo informações de turmas individuais. Com ajuda de subfunções de extração,
    # retira informações de cada turma, coloca-as em hashes, os quais iram compor uma lista de hashes para cada turma.
    # Retorna essa lista.
    def extrair_info_de_todas_turmas (blocos_de_turma)
        lista_de_turmas = Array.new()
        blocos_de_turma.each do |bloco|
            turma = Hash.new()
            turma.merge!(extrair_info_de_disciplina(bloco))
            turma.merge!(extrair_info_de_professor(bloco))
            lista_de_turmas.append(turma)
        end
        return lista_de_turmas
    end

    ##
    # Recebe um arquivo html como entrada. Executa parsing e extrai informações de todas as turmas, cada em um hash.
    # Retorna uma lista de tais hashes.
    def gerar_lista_de_turmas_a_partir_de_arquivo (uploaded_file)
        blocos_de_turma_html = parsear_arquivo_de_turmas(uploaded_file)
        lista_de_turmas = extrair_info_de_todas_turmas(blocos_de_turma_html)
        return lista_de_turmas
    end
    
    ##
    # Adiciona ao banco de dados registros de professores, disciplinas, e turmas, a partir de dados de turmas individuais
    # contidos na lista de hashes de entrada. Para isso, chama funções especiais dos modelos Professor, Disciplina, e Turma,
    # as quais usam valores derivados para campos ausentes.
    def criar_registros_a_partir_de_info_importada(lista_de_turmas)
        lista_de_turmas.each do |hash|
            Professor.criar_professor_com_valores_padroes(hash[:prof_principal])
            Professor.criar_professor_com_valores_padroes(hash[:prof_auxiliar])
            Disciplina.criar_disciplina_com_valores_padroes(hash)
            Turma.criar_turma_a_partir_de_parametros(hash)
        end
    end

end