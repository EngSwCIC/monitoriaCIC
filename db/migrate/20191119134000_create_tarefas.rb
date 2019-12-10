class CreateTarefas < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.string :descricao
      t.decimal :nota
      t.boolean :feito
      t.datetime :inicio
      t.datetime :fim
      t.references :monitoria, foreign_key: true

      t.timestamps
    end
  end
end
