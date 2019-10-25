class CreateTipoDisciplina < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_disciplina do |t|
      t.string "tipo", limit: 45
    end
  end
end
