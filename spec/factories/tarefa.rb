FactoryBot.define do
    factory :tarefa do
      titulo {'Corrigir'}
      descricao {'Corrigir as provas dos alunos todos'}
      nota {8}
      feito {true}
      monitoria_id {'1'}
    end
  end