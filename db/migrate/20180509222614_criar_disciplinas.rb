class CriarDisciplinas < ActiveRecord::Migration[5.2]
  def change
  	create_table 'disciplinas' do |t|
      t.string 'nome'
      t.integer 'codigo'
      t.string 'professor'
      t.integer 'departamento'
    end
  end
end
