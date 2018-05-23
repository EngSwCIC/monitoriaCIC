class User < ActiveRecord::Base
  # has_secure_password

  ## Verifica se o formulário foi preenchido de acordo com a especificação
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :cpf
  validates_presence_of :rg

  ## Verifica se as informações não se repetem no Banco de Dados
  validates_uniqueness_of :email
  validates_uniqueness_of :cpf
  validates_uniqueness_of :rg
end
