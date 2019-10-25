class CreateVagas < ActiveRecord::Migration[5.2]
  def change
    create_table :vagas do |t|
      t.integer "t_total", default: 0, null: false
      t.integer "t_ocupadas", default: 0, null: false
      t.integer "t_restantes", default: 0, null: false
      t.integer "c_total", default: 0, null: false
      t.integer "c_ocupadas", default: 0, null: false
      t.integer "c_restantes", default: 0, null: false
    end
  end
end
