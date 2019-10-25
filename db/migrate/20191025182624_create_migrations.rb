class CreateMigrations < ActiveRecord::Migration[5.2]
  def change
    create_table :migrations do |t|
      t.string "migration", null: false
      t.integer "batch", null: false
    end
  end
end
