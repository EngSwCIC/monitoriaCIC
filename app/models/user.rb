class User < ActiveRecord::Base
  attr_accessor :remember_token, :reset_token
  has_secure_password

  self.primary_key = :id

  ## Verifica se o formulário foi preenchido de acordo com a especificação
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :cpf
  validates_presence_of :rg
  validates_presence_of :matricula

  ## Verifica se as informações não se repetem no Banco de Dados
  validates_uniqueness_of :email
  validates_uniqueness_of :cpf
  validates_uniqueness_of :rg
  validates_uniqueness_of :matricula

  ## Verifica se os campos tem o tamanho correto
  # Verificação do nome
  validates :name, length: { in: 3..50 }, format: {
    without: /[\d]+|['"!¹@²#³$£%¢¨¬&\*\(\)\-_\+=§`´\[\]{}\^~ªº°\?\/:;>.<,\|\\]+/,
    message: 'only letters and spaces'
  }
  # Verificação da matrícula
  validates :matricula, length: { is: 9 }, format: { with: /\A[\d]+\z/, message: "only numbers" }
  # Verificação do email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "invalid email format" }
  # Verificação do CPF
  validates :cpf, length: { is: 11 }, format: { with: /\A[\d]+\z/, message: "only numbers" }
  validate  :valid_cpf
  # Verificação do RG
  validates :rg, length: { minimum: 7 }, format: { with: /\A[\d]+\z/, message: "only numbers" }
  # Verificação da senha e confirmação de senha
  validates :password, length: { in: 6...12, message: "must be between 6 and 12 characters" }, on: :create
  validates :password_confirmation, length: { in: 6...12, message: "must be between 6 and 12 characters" }, on: :create

  # Cálculo de validação dp CPF
  def nth_validation_digit(cpf_array, digit)
    @somatorio  = 0
    @aux        = 0
    @peso       = 12-digit

    cpf_array.each do |value|
      @somatorio += value*(@peso-(@aux))

      @aux += 1
      break if @aux == (11-digit)
    end
    @validation_digit = 11-(@somatorio%11)
    if @validation_digit > 9
      @validation_digit = 0
    end

    return @validation_digit
  end

  def valid_cpf
    @cpf_array = Array.new
    for x in 0...(cpf.length)
      @cpf_array[x] = cpf[x].to_i
    end

    @first = nth_validation_digit(@cpf_array, 2)    # Calcula o @first com base nos 9 digitos
    @second = nth_validation_digit(@cpf_array, 1)   # Calcula o @second com base nos 9 digitos + 1o validação

    if (cpf[9].to_i) != @first || (cpf[10].to_i) != @second
      errors.add(:cpf, "is invalid")
    end
  end

  # Retorna o digest de um hash de uma string passada para o método
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Retorna um token aleatório
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Define os atributos para resetar a senha
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Envia o e-mail para resetar a senha
  def send_password_reset_email
    UserMailer.reset_senha(self).deliver_now
  end

  # Retorna true se o parâmetro password reset expirou
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Retorna true se o token passado é o mesmo que o digest armazenado no banco
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
