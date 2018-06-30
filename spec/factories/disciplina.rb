FactoryBot.define do
  factory :disciplina do
  	nome "Engenharia de Software"
 	fk_tipo_disciplina_id 1
 	c_prat 4
 	c_teor 2
 	c_est 4
 	c_ext 0
  end
end