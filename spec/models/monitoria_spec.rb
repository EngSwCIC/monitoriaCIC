require "rails_helper"

describe Monitoria do
	before :each do
		@monitoria = Monitoria.new(:remuneracao => "Remunerado", :fk_matricula => "150132131", :fk_cod_disciplina => 1, :fk_turmas_id => 1, :fk_status_monitoria_id => 1)
	end

	context "todos os atributos estao presentes" do
		
		#Sad Path
		it "invalido sem remuneracao" do
			@monitoria.remuneracao = ""
			expect(@monitoria.save).to be false 
		end
		it "invalido sem matricula" do 
			@monitoria.fk_matricula = ""
			expect(@monitoria.save).to be false
		end
		it "invalido sem disciplina" do 
			@monitoria.fk_cod_disciplina = ""
			expect(@monitoria.save).to be false
		end
		it "invalido sem turma" do 
			@monitoria.fk_turmas_id = ""
			expect(@monitoria.save).to be false
		end
		it "invalido sem situacao" do 
			@monitoria.fk_status_monitoria_id = ""
			expect(@monitoria.save).to be false
		end
		#Happy Path
		it "monitoria com todos os atributos e valida" do 
			expect(@monitoria.save).to be true
		end
	end

	context "chave primaria :id e unica" do
		before :each do
			@clone = Monitoria.new(:id=>1, :remuneracao => "Remunerado", :fk_matricula => "150132131", :fk_cod_disciplina => 2, :fk_turmas_id => 2, :fk_status_monitoria_id => 1)
		end

		#Sad Path
		it "chave primaria duplicada" do
			@monitoria.id = 1
			@clone.save

			expect{@monitoria.save}.to raise_error(ActiveRecord::RecordNotUnique)
		end

		#Happy Path
		it "chave primaria nao e duplicada" do
			@clone.save
			
			expect{@monitoria.save}.to_not raise_error
		end
	end
	

  describe '#all_status' do
    it 'retorna array com as situaçoes' do
      @status = [['Pendente', 1], ['Recusado', 2], ['Aceito', 3], ['Encerrado', 4]]
      expect(Monitoria.all_status).to eq @status
    end
  end

  describe '#all_disciplinas' do
    it 'retorna array com as disciplinas' do
		@d1 = FactoryBot.create(:disciplina, cod_disciplina: 1, nome: 'Disciplina I')
		@d2 = FactoryBot.create(:disciplina, cod_disciplina: 2, nome: 'Disciplina II')
		@d3 = FactoryBot.create(:disciplina, cod_disciplina: 3, nome: 'Disciplina III')
		expect(Monitoria.all_disciplinas).to eq([['Disciplina I', 1], ['Disciplina II', 2], ['Disciplina III', 3]])
    end
  end

  		#Happy Path - envio de emails
		  describe 'envio um email para cada aluno por monitoria confirmada' do
			it 'sends an email' do
				@monitoria = Monitoria.new(:remuneracao => "Remunerado", :fk_matricula => "140080379", :fk_cod_disciplina => 1, :fk_turmas_id => 1, :fk_status_monitoria_id => 1) 
				@user = User.create!(id: 1, name: "Aluno", matricula: "140080379", email: "aluno@gmail.com", cpf: "67312863035", rg: "2665178", password: "123456", password_confirmation: '123456')
				FactoryBot.create(:turma)
				FactoryBot.create(:professor)
				FactoryBot.create(:disciplina, id:1)

				@monitoria.fk_status_monitoria_id = '3'
				@monitoria.save
				expect { @monitoria.send_resultado_monitoria_prof }
				.to change { ActionMailer::Base.deliveries.count }.by(1)
				expect { @monitoria.send_resultado_monitoria_user }
				.to change { ActionMailer::Base.deliveries.count }.by(1)
			end
		end	
	
	#Sad Path - envio de emails
	
		describe 'envio um email para cada aluno por monitoria nao confirmada' do
			it 'sends an email' do
				
				@monitoria.fk_status_monitoria_id = '2'
				@monitoria.save
				expect { @monitoria.send_resultado_monitoria_prof }
				.to change { ActionMailer::Base.deliveries.count }.by(0)
				expect { @monitoria.send_resultado_monitoria_user }
				.to change { ActionMailer::Base.deliveries.count }.by(0)
			end
		end	
end
