class CreateStatusMonitoria < ActiveRecord::Migration[5.2]
  def change
    create_table :status_monitoria do |t|
      t.string "nome", limit: 45
    end
  end
end
