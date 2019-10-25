class CreateAdmin < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string "name", null: false
      t.string "email", null: false
      t.string "password_digest", null: false
      t.string "remember_token", limit: 100
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["email"], name: "admins_email_unique", unique: true
    end
  end
end
