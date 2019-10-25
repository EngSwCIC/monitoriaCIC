class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
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
  end
end
