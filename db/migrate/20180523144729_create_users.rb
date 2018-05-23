class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :cpf
      t.string :rg
      t.string :matricula
      t.integer :fk_banco
      t.string :rememebr_token

      t.timestamps
    end
  end
end
