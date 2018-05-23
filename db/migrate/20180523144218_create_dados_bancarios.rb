class CreateDadosBancarios < ActiveRecord::Migration[5.2]
  def change
    create_table :dados_bancarios, id: false do |t|
      t.integer :codigo
      t.string :agencia
      t.string :conta_corrente
    end
  end
end
