class CriarAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table 'alunos' do |t|
      t.string 'nome'
      t.string 'matricula'
      t.string 'email'
      t.integer 'cpf'
      t.integer 'rg'
      t.string 'senha'
    end
  end
end
