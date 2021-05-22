class AddPrioridadeAuxiliarToMonitoria < ActiveRecord::Migration[5.2]
  def change
    add_column :monitoria, :prioridade_auxiliar, :integer
  end
end
