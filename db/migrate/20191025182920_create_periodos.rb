class CreatePeriodos < ActiveRecord::Migration[5.2]
  def change
    create_table :periodos do |t|
      t.datetime "inicio"
      t.datetime "fim"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer "fk_id_descricao", null: false
      t.index ["fk_id_descricao"], name: "fk_periodos_descricao_periodo1_idx"
    end
  end
end
