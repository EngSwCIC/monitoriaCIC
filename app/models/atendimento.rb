class Atendimento < ApplicationRecord
  belongs_to :motivo

  validates_presence_of :monitor_id
  validates_presence_of :motivo_id
  validates_presence_of :dia
  
end
