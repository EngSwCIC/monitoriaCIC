class DashboardController < ApplicationController
  before_action :user_logged
  def index; end

  def edit_user
    if current_user.kind_of?(User)
      @user = current_user
    elsif current_user.kind_of?(Professor)
      @professor = current_user
    else
      flash[:danger] = "Apenas alunos e professores podem editar o perfil!"
      redirect_to dashboard_path
    end
  end

  def dados_bancarios; end

  def turmas; end

  ##
  # Método chama a view dashboard/atendimentos para renderizar todos os atendimentos
  def atendimentos; end

  def atividades; end

  def monitorias
    @user = current_user
    @monitorias = Array.new
    Monitoria.find_each do |m|
      if @user.kind_of?(User)
        if m.fk_matricula == @user.matricula
          if m.fk_status_monitoria_id != 4
            @monitorias << m
          end
        end
      end
    end
  end

  def disciplinas
    @disciplinas = Disciplina.find_each
  end

  def apagar_alunos
    @users = User.order(:matricula)
  end

  def historico
    @user = current_user
    @mostrar = Array.new
    Monitoria.find_each do |m|
      if (@user.kind_of?(User) && m.fk_matricula == @user.matricula && m.fk_status_monitoria_id == 4)
        @mostrar << m
      end
    end
  end

  def deletar_aluno
    @matricula = params[:user][:matricula]
    if @matricula.length == 0
      @matricula = nil
    end
    @user = User.find_by_matricula(@matricula)

    if !@user.nil?
      @dados_bancarios = DadosBancarios.where(id: @user.fk_banco)
      if !@dados_bancarios.nil?
        DadosBancarios.delete(@dados_bancarios)
      end

      @monitoria = Monitoria.where(fk_matricula: @user.matricula)
      if !@monitoria.nil?
        Monitoria.delete(@monitoria)
      end

      @user = User.delete(@user.id)
      flash[:notice] = 'Aluno apagado com sucesso!'
    else
      if !@matricula.nil?
        flash[:danger] = "Aluno de matrícula #{@matricula} não existe."
      else
        flash[:danger] = "Digite uma matrícula para deletar algum aluno."
      end
    end

    redirect_to dashboard_apagar_alunos_path
  end

  def importar_disciplinas
    @disciplinas = Disciplina.all
  end

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
        turma[:nomeDisciplina] = infoDisciplinaTurma[0].to_s.match(/^\s+\S+ - (.+)+ -/)[1]
        turma[:codigoDisciplina] = infoDisciplinaTurma[0].to_s.match(/^\s+(\S+) -/)[1]
        turma[:codigoTurma] = infoDisciplinaTurma[1].to_s.match(/^\s+(\S+)\s/)[1]
        turma[:situacao] = infoDisciplinaTurma[2].to_s.match(/<td>\s+(.+?)\s+<\/td>/)[1]
        # puts 'DEBUG   ' + turma[:nomeDisciplina] + ' ' + turma[:codigoDisciplina] + ' ' + turma[:codigoTurma] + ' ' + turma[:situacao]

        infoProfessor = t.at_css('tr.componentescur').next_element.css('td') # Pulamos as quatro primeiras rows na tabela
        turma[:nomeProfessor1] = infoProfessor[0].css('i').to_s.match(/<i>(.+?) \(.+\)/)
        if (turma[:nomeProfessor1] == nil)
          turma[:nomeProfessor1] = ''
        else
          turma[:nomeProfessor1] = turma[:nomeProfessor1][1]
        end
        turma[:nomeProfessor2] = infoProfessor[0].css('i').to_s.match(/<br>(.+?) \(.+\)/) # Espera-se que seja = nil se houver só um professor
        if (turma[:nomeProfessor2] == nil)
          turma[:nomeProfessor2] = ''
        else
          turma[:nomeProfessor2] = turma[:nomeProfessor2][1]
        end
        turma[:reserva] = infoProfessor[1].css('i').to_s.match(/<i><?i?>?(.+?)\/?<\/i><?/)[1]
        listaDeHashesDeTurmas.append(turma)
    end
    return listaDeHashesDeTurmas
  end

  def criar_professor_com_valores_padroes (nomeProfessor)
    nomeFormatado = nomeProfessor.split.map(&:capitalize).join(' ') # Transforme a primeira letra de cada nome em maiúscula
    if (!Professor.exists?(name: nomeFormatado))
      usuarioPadrao = nomeFormatado.split.join('')[0...14]
      emailPadrao = usuarioPadrao + '@unb.br'
      senhaPadrao = '123456abc'
      role = 1
      Professor.create(name: nomeFormatado, email: emailPadrao, username: usuarioPadrao, password: senhaPadrao, password_confirmation: senhaPadrao, role: role)
    end
  end

  def criar_disciplina_com_valores_padroes (nome, codigo)
    if (!Disciplina.exists?(nome: nome))
      Disciplina.create([{nome: nome, 
          fk_tipo_disciplina_id: 1, c_prat: 0, c_teor: 0, 
          cod_disciplina: codigo}])
    else
      raise "Aviso: Uma ou mais disciplinas já estão presentes no banco de dados"
    end
  end

  def criar_turma_a_partir_de_parametros (codigo, nomeDisciplina, nomeProfPrincipal, nomeProfAuxiliar)
    disciplinaId = Disciplina.find_by(nome: nomeDisciplina).id
    if (Disciplina.exists?(nome: nomeDisciplina)) && (!Turma.exists?(
      fk_cod_disciplina: disciplinaId,
      turma: codigo,
      professor: nomeProfPrincipal,
      professor_aux: nomeProfAuxiliar,
      fk_vagas_id: 1 ))
      Turma.create([{
          fk_cod_disciplina: disciplinaId,
          turma: codigo,
          professor: nomeProfPrincipal,
          professor_aux: nomeProfAuxiliar,
          fk_vagas_id: 1
      }])
    end
  end

  def raspar_disciplinas
    # E se apertarem o botão sem arquivo nenhum??
    array_de_turmas = parse_turmas_file(params[:arquivo_turmas])
    array_de_turmas.each do |hash|
      criar_professor_com_valores_padroes(hash[:nomeProfessor1])
      if (hash[:nomeProfessor2] != '')
        criar_professor_com_valores_padroes(hash[:nomeProfessor2])
      end
      begin
        criar_disciplina_com_valores_padroes(hash[:nomeDisciplina], hash[:codigoDisciplina])
      rescue StandardError => e
        flash[:danger] = "#{e.message}"
      end
      criar_turma_a_partir_de_parametros(hash[:codigoTurma], hash[:nomeDisciplina], hash[:nomeProfessor1], hash[:nomeProfessor2])
    end
    flash[:notice] = "Disciplinas importadas com sucesso!"


    # disciplinas = raspar_matriculaweb_disciplinas
    # carregar_disciplinas(disciplinas)

    redirect_to dashboard_importar_disciplinas_path
  rescue StandardError => e
    flash[:danger] = e.message
    redirect_to dashboard_importar_disciplinas_path
  end  
  
  def importar_professores
    @teachers = Professor.all
  end

  def scrape_professores
    web_scraper
    redirect_to dashboard_importar_professores_path
  end

  private
  def user_logged
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar essa página"
    end
  end


  ##
  # Método que faz a requisição da página das disciplinas.
  #
  # Retorna uma lista de hashes com os dados das disciplinas.

  def raspar_matriculaweb_disciplinas(url = "https://matriculaweb.unb.br/graduacao/oferta_dis.aspx?cod=116")
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    pagina = Nokogiri::HTML(open(url))
    tbls_disciplinas = pagina.css('#datatable').css('tr').drop(1)

    disciplinas = []

    tbls_disciplinas.each do |d|
      
      disciplinas << extrai_campos_disciplina(d)

    end

    disciplinas

  end

  ##
  # Método que realiza as extrações dos dados da disciplina.
  # Retorna um hash com as informações da disciplina.
  def extrai_campos_disciplina(node)
  
    link_disciplina = node.css('td')[1].css('a')[0][:href]

    info_disciplina = raspar_pagina_disciplina(caminho = link_disciplina)

    {
      :cod_disciplina => node.css('td')[0].text,
      :nome_disciplina => node.css('td')[1].text.titleize,
      :creditos => info_disciplina[:creditos],
      :turmas => info_disciplina[:turmas]
    }

  end

  ##
  # Método para fazer a requisição da página da oferta de uma disciplina específica.
  # Retorna um hash com as informações de créditos e turmas das disciplinas.
  def raspar_pagina_disciplina(caminho, url_base = "https://matriculaweb.unb.br/graduacao/")
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    pagina = Nokogiri::HTML(open(url_base + caminho))
    tabelas = pagina.css('#datatable')

    c_teor, c_prat, c_ext, c_est = tabelas[0]
      .css('tr:nth-child(4) > td')
      .text.split('-').map {|str| str.to_i}

    {
      :creditos => {
        :c_prat => c_prat,
        :c_teor => c_teor,
        :c_est => c_est,
        :c_ext => c_ext
      },
      :turmas => extrai_turmas(tabelas)
    }

  end

  ##
  # Método para raspagem das turmas da disciplina.
  # Retorna uma lista de hashes das turmas.
  def extrai_turmas(node)
    turmas = []
    node.drop(1).each do |t|
      turmas << extrai_campos_turma(t)
    end
    turmas
  end

  ##
  # Método para extração das informações da turma da página da oferta da
  # disciplina no MatrículoWeb.
  # Retorna um hash com nome da turma e nome do professor.
  def extrai_campos_turma(node)
    {
      :nome_turma => node.css('td.turma').text,
      :nome_professor => node.css('tbody > tr > td:nth-child(5) td').text
    }
  end

  ##
  # Método para carregar as disciplinas no modelo.
  def carregar_disciplinas(disciplinas)
    disciplinas.each do |d|

      if !Disciplina.find_by_cod_disciplina(d[:cod_disciplina])

        criar_disciplina(
          d[:cod_disciplina],
          d[:nome_disciplina],
          d[:creditos]
        )
      end
    end
  end

  ##
  # Método para criar uma disciplina no modelo.
  def criar_disciplina(cod_disciplina, nome, creditos)
    Disciplina.create(
      :cod_disciplina => cod_disciplina,
      :nome => nome,
      :c_prat => creditos[:c_prat],
      :c_teor => creditos[:c_teor],
      :c_est => creditos[:c_est],
      :c_ext => creditos[:c_ext]
    )
  end


  # Faz um web scrape da página do CIC para adquirir os dados dos professores e cadastrá-los no BD
  def web_scraper
    # Habilitam a abertura de webpages no código
    require 'open-uri'
    require 'openssl'

    # Cria um node a partir da página do CIC, filtrando pela 'div' em questão os elementos 'li'. Esse node contém todas
    # as informações disponíveis de todos os professores
    teachers_list = Nokogiri::HTML(open('https://cic.unb.br/professores/',
                                        :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)).
        css('div#main-content').
        css('li')

    teachers_list.each do |t|
      email = t.css('span.p-email').text.reverse

      # Verifica se o e-mail pertence ao domínio da UnB e se o e-mail já está cadastrado no banco de dados
      if valid_email?(email) && !Professor.find_by_email(email)
        create_teacher(t, email)
      end
    end
  end

  # Verifica se o e-mail pertence ao domínio da UnB (retorna 'true' se sim e 'false', caso contrário)
  def valid_email?(email)
    email =~ /\A[\w+\-.]+@unb\.br\z/i
  end

  # Cadastra um professor no banco de dados
  def create_teacher(teacher, email)
    pwd = generate_password
    Professor.create(:name => teacher.css('h4.people-details-h4').text.match(/(\S+\.?\s?)+/),
                     :email => email,
                     :username => email.match(/[^@]+/),
                     :role => match_role(teacher.css('span.people-details.p-people').text),
                     :password => pwd,
                     :password_confirmation => pwd)
  end

  # Gera uma string de caracteres aleatórios de tamanho adequado para salvar como senha do professor no BD.
  # Essa senha é apenas um placeholder, durante o cadastro, o professor deverá modifica-la.
  def generate_password
    require 'securerandom'
    SecureRandom.base64(9)
  end

  # Faz o match da titularidade do professor com o número esperado no BD
  def match_role(role)
    case role
    when /substituto/i
      1
    when /colaborador/i
      3
    when /adjunto/i
      4
    when /associado/i
      5
    when /titular/i
      6
    # Cláusula específica para um erro comum do parser: retornar uma string contendo apenas caracteres de espaço
    when /\A\s/
      0
    # Cláusula padrão retorna um valor para cadastrar o professor com o papel de 'professor' no BD
    else
      2
    end
  end

end
