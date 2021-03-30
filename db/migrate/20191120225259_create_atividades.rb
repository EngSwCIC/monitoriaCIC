class CreateAtividades < ActiveRecord::Migration[5.2]
  def change
    create_table :atividades do |t|
      t.string :titulo
      t.text :mensagem
      t.string :matricula_monitor
      t.date :data

      t.timestamps
    end
  end
end
