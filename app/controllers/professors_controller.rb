class ProfessorsController < ApplicationController
  def index 
    #@CicList = ["Shacon", "Alchieri", "Díbio", "Genaina", "Celio"]
    scrape_professors unless Professor.any?
    @professor = Professor.all
  end

  def new ; end

  def create
    @professor = Professor.create(professor_params)

    if !@professor.errors.any?
      flash[:notice] = "Registro realizado com sucesso!"
      log_in(@professor)
      redirect_to dashboard_path
    else
      flash[:danger] = @professor.errors.full_messages
      redirect_to new_professor_path
    end
  end
  def identityconfirmation
    @professor = Professor.where(:name => params[:professor][:name])[0]
    # Acrescente um ponto de exclamação em deliver_now para renderizar as mensagens de erro...
    ProfessorMailer.with(professor: @professor).key_email.deliver_now
  end

  def update
    @professor = Professor.find_by_email(session[:user_id])
    @professor.update_attributes(professor_params)

    if !@professor.errors.any?
      flash[:notice] = "Cadastro atualizado com sucesso!"
    elsif
      flash[:danger] = @professor.errors.full_messages
    end

    redirect_to dashboard_path
  end

  private

  def scrape_professors
    require 'open-uri'
    require 'openssl' # Habilita a abertura de webpages no código

    # Guarda o conteúdo da página na variável 'page'
    page = Nokogiri::HTML(open('https://cic.unb.br/professores/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    main_content = page.css('div#main-content')
    teachers_list = main_content.css('li')

    teachers_list.each do |t|
      email = t.css('span.p-email').text.reverse

      if valid_email?(email)
        name = t.css('h4.people-details-h4').text.match(/(\S+\.?\s?)+/)
        moniker = email.match(/[^@]+/)
        role = match_role(t.css('span.people-details.p-people').text)
        pwd = generate_password

        professor = Professor.new
        professor.name = name
        professor.email = email
        professor.username = moniker
        professor.role = role
        professor.password = pwd
        professor.password_confirmation = pwd

        professor.save
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

  #return [['Professor(a) substituto(a)', 1], ['Professor(a)', 2], ['Professor(a) Colaborador(a)', 3],
  #['Professor(a) Adjunto(a)', 4], ['Professor(a) Associado(a)', 5], ['Professor(a) Titular', 6]]

  protected

  def professor_params
    params.require(:professor).permit(:id, :name, :username, :email, :role, :password, :password_confirmation)
  end
end