# frozen string literal: true

require 'rails_helper'

describe Tarefa do
  describe 'validations' do
    before :each do
        @tarefa = Tarefa.new(titulo: 'Tarefa', descricao: 'A tarefa eh mt complicada',monitoria_id: "1", nota: 8, feito: true)
    end
    context "todos os atributos estao presentes" do
        
        #Happy Path
        it "tarefa com todos os atributos e valida" do
            @monitoria = FactoryBot.create(:monitoria, id: '1')
            expect(@tarefa.save).to be true
        end
		#Sad Path
		it "invalido sem titulo" do
			@tarefa.titulo = nil
			expect(@tarefa.save).to be false 
		end
		it "invalido sem descricao" do 
			@tarefa.descricao = nil
			expect(@tarefa.save).to be false
		end
		
		it "invalido sem monitor" do 
			@tarefa.monitoria_id = nil
			expect(@tarefa.save).to be false
        end
        
	end
  end
end