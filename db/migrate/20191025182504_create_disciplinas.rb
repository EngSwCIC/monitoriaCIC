class CreateDisciplinas < ActiveRecord::Migration[5.2]
  def change
    create_table :disciplinas do |t|
      t.string "nome", null: false
      t.integer "fk_tipo_disciplina_id", default: 2, null: false
      t.integer "c_prat", default: 0, null: false
      t.integer "c_teor", default: 0, null: false
      t.integer "c_est", default: 0, null: false
      t.integer "c_ext", default: 0, null: false
      t.integer "cod_disciplina", default: 0, null:false
      t.index ["cod_disciplina"], name: "disciplinas_cod_disciplina_index"
      t.index ["fk_tipo_disciplina_id"], name: "fk_disciplinas_tipo_disciplina1_idx"
    end
  end
end
