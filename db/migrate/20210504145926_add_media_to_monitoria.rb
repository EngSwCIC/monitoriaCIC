class AddMediaToMonitoria < ActiveRecord::Migration[5.2]
  def change
    add_column :monitoria, :media, :float, default: 0
  end
end
