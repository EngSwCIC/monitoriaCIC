class CreateAtendimentos < ActiveRecord::Migration[5.2]
  def change
    create_table :atendimentos do |t|
      t.references :motivo, foreign_key: true
      t.date :dia
      t.string :descricao
      t.string :aluno_atendido

      t.timestamps
    end
  end
end
