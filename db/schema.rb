# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_05_021717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "remember_token", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "admins_email_unique", unique: true
  end

  create_table "atendimentos", force: :cascade do |t|
    t.bigint "motivo_id"
    t.date "dia"
    t.string "descricao"
    t.string "aluno_atendido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monitor_id"
    t.index ["monitor_id"], name: "index_atendimentos_on_monitor_id"
    t.index ["motivo_id"], name: "index_atendimentos_on_motivo_id"
  end

  create_table "atividades", force: :cascade do |t|
    t.string "titulo"
    t.text "mensagem"
    t.string "matricula_monitor"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bolsas", force: :cascade do |t|
    t.integer "quantidade"
    t.datetime "created_at"
  end

  create_table "dados_bancarios", force: :cascade do |t|
    t.string "codigo", limit: 11, null: false
    t.string "agencia", limit: 11, null: false
    t.string "conta_corrente", limit: 11, null: false
  end

  create_table "descricao_periodo", force: :cascade do |t|
    t.string "descricao", limit: 45
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "nome", null: false
    t.integer "fk_tipo_disciplina_id", default: 2, null: false
    t.integer "c_prat", default: 0, null: false
    t.integer "c_teor", default: 0, null: false
    t.integer "c_est", default: 0, null: false
    t.integer "c_ext", default: 0, null: false
    t.integer "cod_disciplina", default: 0, null: false
    t.boolean "monitoria", default: false
    t.index ["cod_disciplina"], name: "disciplinas_cod_disciplina_index"
    t.index ["fk_tipo_disciplina_id"], name: "fk_disciplinas_tipo_disciplina1_idx"
  end

  create_table "migrations", force: :cascade do |t|
    t.string "migration", null: false
    t.integer "batch", null: false
  end

  create_table "monitoria", force: :cascade do |t|
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

  create_table "motivos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "password_resets", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.datetime "created_at"
    t.index ["email"], name: "password_resets_email_index"
    t.index ["token"], name: "password_resets_token_index"
  end

  create_table "periodos", force: :cascade do |t|
    t.datetime "inicio"
    t.datetime "fim"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "fk_id_descricao", null: false
    t.index ["fk_id_descricao"], name: "fk_periodos_descricao_periodo1_idx"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "role", null: false
    t.string "remember_token", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["username"], name: "professors_username_unique", unique: true
  end

  create_table "status_monitoria", force: :cascade do |t|
    t.string "nome", limit: 45
  end

  create_table "status_turma", force: :cascade do |t|
    t.string "nome", limit: 45
  end

  create_table "tarefas", force: :cascade do |t|
    t.string "titulo", null: false
    t.string "descricao", null: false
    t.decimal "nota"
    t.boolean "feito"
    t.datetime "inicio"
    t.datetime "fim"
    t.bigint "monitoria_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monitoria_id"], name: "index_tarefas_on_monitoria_id"
  end

  create_table "tipo_disciplina", force: :cascade do |t|
    t.string "tipo", limit: 45
  end

  create_table "turmas", force: :cascade do |t|
    t.string "turma", null: false
    t.string "professor", null: false
    t.integer "fk_cod_disciplina", null: false
    t.integer "fk_status_turma_id", default: 3, null: false
    t.integer "qnt_bolsas", default: 0, null: false
    t.integer "fk_vagas_id", null: false
    t.index ["fk_cod_disciplina"], name: "fk_turmas_disciplinas1_idx"
    t.index ["fk_status_turma_id"], name: "fk_turmas_status_turma1_idx"
    t.index ["fk_vagas_id"], name: "fk_turmas_vagas1_idx"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "cpf", limit: 11, null: false
    t.string "rg", limit: 11, null: false
    t.string "matricula", limit: 11, null: false
    t.integer "fk_banco"
    t.string "remember_token", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["cpf"], name: "users_cpf_unique", unique: true
    t.index ["email"], name: "users_email_unique", unique: true
    t.index ["fk_banco"], name: "fk_banco"
    t.index ["matricula"], name: "users_matricula_unique", unique: true
    t.index ["rg"], name: "users_rg_unique", unique: true
  end

  create_table "vagas", force: :cascade do |t|
    t.integer "t_total", default: 0, null: false
    t.integer "t_ocupadas", default: 0, null: false
    t.integer "t_restantes", default: 0, null: false
    t.integer "c_total", default: 0, null: false
    t.integer "c_ocupadas", default: 0, null: false
    t.integer "c_restantes", default: 0, null: false
  end

  add_foreign_key "atendimentos", "motivos"
  add_foreign_key "atendimentos", "users", column: "monitor_id"
  add_foreign_key "tarefas", "monitoria", column: "monitoria_id"
end
