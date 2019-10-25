class CreateStatusTurma < ActiveRecord::Migration[5.2]
  def change
    create_table :status_turma do |t|
      t.string "nome", limit: 45
    end
  end
end
