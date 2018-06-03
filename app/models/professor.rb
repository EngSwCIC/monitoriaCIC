class Professor < ActiveRecord::Base
  has_secure_password

  self.primary_key = :id

  def self.all_roles
    return [['Professor(a) substituto(a)', 1], ['Professor(a)', 2], ['Professor(a) Colaborador(a)', 3],
            ['Professor(a) Adjunto(a)', 4], ['Professor(a) Associado(a)', 5], ['Professor(a) Titular', 6]]
  end

  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  # Verificação do nome
  validates :name, length: { in: 3...50 }, format: { without: /[\d]+|[!@#$%*\(\)\|\\;\:\/?\]\[=\+\-_",\.]+/, message: "only letters and spaces" }
  # Verificação do email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@unb\.br\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "not a UnB email" }
  # Verificação da senha e confirmação de senha
  validates :password, length: { in: 6...12, message: "must be between 6 and 12 characters" }, on: :create
  validates :password_confirmation, length: { in: 6...12, message: "must be between 6 and 12 characters" }, on: :create
end