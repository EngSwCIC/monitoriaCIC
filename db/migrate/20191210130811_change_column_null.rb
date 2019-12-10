class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tarefas, :titulo, false
    change_column_null :tarefas, :descricao, false
  end
end
