class CreateDescricaoPeriodo < ActiveRecord::Migration[5.2]
  def change
    create_table :descricao_periodo do |t|
      t.string "descricao", limit: 45
    end
  end
end
