class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
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
  end
end
