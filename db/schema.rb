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

ActiveRecord::Schema.define(version: 2018_05_23_144729) do

  create_table "dados_bancarios", id: false, force: :cascade do |t|
    t.integer "codigo"
    t.string "agencia"
    t.string "conta_corrente"
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "cpf", null: false
    t.string "rg", null: false
    t.string "matricula", null: false
    t.integer "fk_banco"
    t.string "rememebr_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "users_cpf_unique", unique: true
    t.index ["email"], name: "users_email_unique", unique: true
    t.index ["fk_banco"], name: "fk_banco"
    t.index ["matricula"], name: "users_matricula_unique", unique: true
    t.index ["rg"], name: "users_rg_unique", unique: true
  end

end
