class DadosBancarios < ActiveRecord::Base
  self.primary_key = :id

  validates_presence_of :codigo
  validates_presence_of :agencia
  validates_presence_of :conta_corrente
end