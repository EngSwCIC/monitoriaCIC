class AddProfessorAuxiliarToTurma < ActiveRecord::Migration[5.2]
  def change
    add_column :turmas, :professor_auxiliar, :string
  end
end
