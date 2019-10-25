class CreateBolsas < ActiveRecord::Migration[5.2]
  def change
    create_table :bolsas do |t|
      t.integer "quantidade"
      t.datetime "created_at"
    end
  end
end
