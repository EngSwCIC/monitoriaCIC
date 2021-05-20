class AddFieldsToMonitoria < ActiveRecord::Migration[5.2]
  def change
    add_column :monitoria, :ira, :string
    add_column :monitoria, :mencao, :string
  end
end
