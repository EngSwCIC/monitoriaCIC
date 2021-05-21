class ChangePrioridadeTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :monitoria, :prioridade, :float
    change_column :monitoria, :prioridade_auxiliar, :float
  end
end
