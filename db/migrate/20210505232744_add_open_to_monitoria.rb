class AddOpenToMonitoria < ActiveRecord::Migration[5.2]
  def change
    add_column :monitoria, :open, :boolean, default: true
  end
end
