class CreateTurmas < ActiveRecord::Migration[5.2]
  def change
    create_table :turmas do |t|
      t.string "turma", null: false
      t.string "professor", null: false
      t.string "professor_aux", default: ''
      t.integer "fk_cod_disciplina", null: false
      t.integer "fk_status_turma_id", default: 3, null: false
      t.integer "qnt_bolsas", default: 0, null: false
      t.integer "fk_vagas_id", null: false
      t.index ["fk_cod_disciplina"], name: "fk_turmas_disciplinas1_idx"
      t.index ["fk_status_turma_id"], name: "fk_turmas_status_turma1_idx"
      t.index ["fk_vagas_id"], name: "fk_turmas_vagas1_idx"
    end
  end
end
