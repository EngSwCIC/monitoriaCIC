class CreateDadosBancarios < ActiveRecord::Migration[5.2]
  def change
    create_table :dados_bancarios do |t|
      t.string "codigo", limit: 11, null: false
      t.string "agencia", limit: 11, null: false
      t.string "conta_corrente", limit: 11, null: false
    end
  end
end
