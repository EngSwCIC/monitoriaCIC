class CreateMotivos < ActiveRecord::Migration[5.2]
  def change
    create_table :motivos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
