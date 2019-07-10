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

  def monitorias
    @user = current_user
    @monitorias = Array.new
    Monitoria.find_each do |m|
      if @user.kind_of?(User)
        if m.fk_matricula == @user.matricula
          @monitorias << m
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


  def raspar_disciplinas
    disciplinas = raspar_matriculaweb_disciplinas
    carregar_disciplinas(disciplinas)

    redirect_to dashboard_importar_disciplinas_path
  end

  private
  def user_logged
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar essa página"
    end
  end


  def raspar_matriculaweb_disciplinas(url = "https://matriculaweb.unb.br/graduacao/oferta_dis.aspx?cod=116")
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    pagina = Nokogiri::HTML(open(url))
    tbls_disciplinas = pagina.css('#datatable').css('tr').drop(1)

    disciplinas = []

    tbls_disciplinas.each do |d|
      cod_disciplina = d.css('td')[0].text
      nome_disciplina = d.css('td')[1].text.titleize
      link_disciplina = d.css('td')[1].css('a')[0][:href]

      info_disciplina = raspar_pagina_disciplina(caminho = link_disciplina)
      creditos = info_disciplina[:creditos]
      turmas = info_disciplina[:turmas]

      disciplinas << {
        :cod_disciplina => cod_disciplina,
        :nome_disciplina => nome_disciplina,
        :c_prat => creditos[:c_prat],
        :c_teor => creditos[:c_teor],
        :c_est => creditos[:c_est],
        :c_ext => creditos[:c_ext],
        :turmas => turmas
      }

    end

    disciplinas

  end

  def raspar_pagina_disciplina(caminho, url_base = "https://matriculaweb.unb.br/graduacao/")
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    pagina = Nokogiri::HTML(open(url_base + caminho))
    tabelas = pagina.css('#datatable')

    c_teor, c_prat, c_ext, c_est = tabelas[0]
      .css('tr:nth-child(4) > td')
      .text.split('-').map {|str| str.to_i}

    turmas = []
    tabelas.drop(1).each do |t|
      turmas << {
        :nome_turma => t.css('td.turma').text,
        :nome_professor => t.css('tbody > tr > td:nth-child(5) td').text
      }
    end

    {
      :creditos => {
        :c_prat => c_prat,
        :c_teor => c_teor,
        :c_est => c_est,
        :c_ext => c_ext
      },
      :turmas => turmas
    }

  end


  def carregar_disciplinas(disciplinas)
    disciplinas.each do |d|

      if !Disciplina.find_by_cod_disciplina(d[:cod_disciplina])

        Disciplina.create(
          :cod_disciplina => d[:cod_disciplina],
          :nome => d[:nome_disciplina],
          :c_prat => d[:c_prat],
          :c_teor => d[:c_teor],
          :c_est => d[:c_est],
          :c_ext => d[:c_ext]
        )

      end

    end

  end

end
