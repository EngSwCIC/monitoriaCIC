class Atendimento < ApplicationRecord
  ##
  # Cada atendimento está associado à um monitor
  belongs_to :motivo
  
  ##
  # atendimento possui os campos obrigatórios monitor_id, motivo_id e dia
  validates_presence_of :monitor_id
  validates_presence_of :motivo_id
  validates_presence_of :dia
  
end
