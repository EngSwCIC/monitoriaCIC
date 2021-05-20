class RemoveDescricaoFromMonitoria < ActiveRecord::Migration[5.2]
  def change
    remove_column :monitoria, :descricao_status
  end
end
