class User < ActiveRecord::Base
  has_secure_password

  self.primary_key = :id

  ## Verifica se o formulário foi preenchido de acordo com a especificação
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :cpf
  validates_presence_of :rg

  ## Verifica se as informações não se repetem no Banco de Dados
  validates_uniqueness_of :email
  validates_uniqueness_of :cpf
  validates_uniqueness_of :rg

  ## Verifica se os campos tem o tamanho correto
  # Verificação do nome
  validates :name, length: { in: 3...50 }, format: { without: /[\d]+|[!@#$%*\(\)\|\\;\:\/?\]\[=\+\-_",\.]+/, message: "only letters and spaces" }
  # Verificação da matrícula
  validates :matricula, length: { is: 9 }, format: { with: /\A[\d]+\z/, message: "only numbers" }
  # Verificação do email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "invalid email format" }
  # Verificação do CPF
  validates :cpf, length: { is: 11 }, format: { with: /[\d]+/, message: "only numbers" }
  validate  :valid_cpf
  # Verificação do RG
  validates :rg, length: { minimum: 7 }, format: { with: /[\d]+/, message: "only numbers" }
  # Verificação da senha e confirmação de senha
  validates :password, length: { in: 6...12, message: "must be between 6 and 12 characters" }, on: :create
  validates :password_confirmation, length: { in: 6...12, message: "must be between 6 and 12 characters" }, on: :create

  ## Cálculo de validação dp CPF
  def valid_cpf
    @cpf_array = Array.new
    @somatorio = 0

    for x in 0...(cpf.length)
      @cpf_array[x] = cpf[x].to_i
    end

    @aux = 0
    @cpf_array.each do |value|
      @somatorio += value*(10-(@aux))

      @aux += 1
      break if @aux == 9
    end
    @first = 11-(@somatorio%11)
    if @first > 9
      @first = 0
    end

    @somatorio = 0
    @aux = 0
    @cpf_array.each do |value|
      @somatorio += value*(11-(@aux))

      @aux += 1
      break if @aux == 10
    end
    @second = 11-(@somatorio%11)
    if @second > 9
      @second = 0
    end

    if (cpf[9].to_i) != @first || (cpf[10].to_i) != @second
      errors.add(:cpf, "is invalid")
    end
  end

  end
