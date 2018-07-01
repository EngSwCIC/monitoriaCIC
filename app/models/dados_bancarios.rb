class DadosBancarios < ActiveRecord::Base
  self.primary_key = :id

  validates_presence_of :codigo
  validates_presence_of :agencia
  validates_presence_of :conta_corrente

  validates :codigo, length: { in: 6..25 }, format: {
      without: /[\d]+|['"!¹@²#³$£%¢¨¬&\*\(\)\-_\+=§`´\[\]{}\^~ªº°\?\/:;>.<,\|\\]+/,
      message: 'only letters and spaces'
  }

  validates :agencia, format: { with: /\A[\d]+\z/, message: "only numbers" }
  validates :conta_corrente, format: { with: /\A[\d]+\z/, message: "only numbers" }
end