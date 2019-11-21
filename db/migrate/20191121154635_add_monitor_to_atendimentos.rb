class AddMonitorToAtendimentos < ActiveRecord::Migration[5.2]
  def change
    add_reference :atendimentos, :monitor, foreign_key: true
  end
end
