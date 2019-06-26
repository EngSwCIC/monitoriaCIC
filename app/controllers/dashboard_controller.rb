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

      if valid_email?(email)
        unless Professor.find_by_email(email)
          pwd = generate_password
          professor = Professor.create(:name => t.css('h4.people-details-h4').text.match(/(\S+\.?\s?)+/),
                                       :email => email,
                                       :username => email.match(/[^@]+/),
                                       :role => match_role(t.css('span.people-details.p-people').text),
                                       :password => pwd,
                                       :password_confirmation => pwd)
        end
      end
    end
  end

  def valid_email?(email)
    email =~ /\A[\w+\-.]+@unb\.br\z/i
  end

  def generate_password
    require 'securerandom'
    SecureRandom.base64(9)
  end

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
    when /\A\s/
      0
    else
      2
    end
  end
end
