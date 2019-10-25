class CreatePasswordResets < ActiveRecord::Migration[5.2]
  def change
    create_table :password_resets do |t|
      t.string "email", null: false
      t.string "token", null: false
      t.datetime "created_at"
      t.index ["email"], name: "password_resets_email_index"
      t.index ["token"], name: "password_resets_token_index"
    end
  end
end
