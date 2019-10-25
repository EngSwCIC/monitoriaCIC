class CreateMonitoria < ActiveRecord::Migration[5.2]
  def change
    create_table :monitoria do |t|
      t.string "remuneracao", limit: 45, null: false
      t.string "fk_matricula", limit: 11, null: false
      t.integer "fk_cod_disciplina", null: false
      t.integer "fk_turmas_id", null: false
      t.text "descricao_status"
      t.integer "prioridade"
      t.integer "fk_status_monitoria_id", null: false
      t.index ["fk_cod_disciplina"], name: "fk_monitoria_disciplinas1_idx"
      t.index ["fk_matricula"], name: "fk_matricula_UNIQUE"
      t.index ["fk_matricula"], name: "fk_monitoria_users_idx"
      t.index ["fk_status_monitoria_id"], name: "fk_monitoria_status_monitoria1_idx"
      t.index ["fk_turmas_id"], name: "fk_monitoria_turmas1_idx"  
    end
  end
end
