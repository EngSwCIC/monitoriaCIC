require "rails_helper"

describe Disciplina do
	before :each do
		@disciplina = Disciplina.new(:nome => "Engenharia de Software", :fk_tipo_disciplina_id => 1, :c_prat => 4, :c_teor => 2, :c_est => 4, :c_ext => 0)
	end

	context "todos os atributos estao presentes" do
		
		#Sad Path
		it "invalido sem nome" do
			@disciplina.nome = ""
			expect(@disciplina.save).to be false 
		end
		it "invalido sem tipo" do 
			@disciplina.fk_tipo_disciplina_id = ""
			expect(@disciplina.save).to be false
		end
		it "invalido sem credito pratico" do 
			@disciplina.c_prat = ""
			expect(@disciplina.save).to be false
		end
		it "invalido sem credito teorico" do 
			@disciplina.c_teor = ""
			expect(@disciplina.save).to be false
		end
		it "invalido sem credito est" do 
			@disciplina.c_est = ""
			expect(@disciplina.save).to be false
		end
		it "invalido sem credito ext" do 
			@disciplina.c_ext = ""
			expect(@disciplina.save).to be false
		end

		#Happy Path
		it "disciplina com todos os atributos e valida" do 
			expect(@disciplina.save).to be true
		end
	end

	context "chave primaria :cod_disciplina e unica" do
		before :each do
			@clone = Disciplina.new(:cod_disciplina => 1, :nome => "Banco de Dados", :fk_tipo_disciplina_id => 1, :c_prat => 4, :c_teor => 2, :c_est => 4, :c_ext => 0)
		end

		#Sad Path
		it "chave primaria duplicada" do
			@disciplina.cod_disciplina = 1
			@clone.save

			expect{@disciplina.save}.to raise_error(ActiveRecord::RecordNotUnique)
		end

		#Happy Path
		it "chave primaria nao e duplicada" do
			@clone.save
			
			expect{@disciplina.save}.to_not raise_error
		end
	end

	context "validacao dos dados dos atributos" do
	
		it ':nome contem apenas caracteres validos' do
	      invalid_chars = ["'", '"', '!', '@', '#', '$', '%', '*', '(', ')', '_',
	                       '-', '+', '=', '§', '~', '^', "\\", '[', ']', '{', '}', '/', '?', '°',
	                       ';', ':', '.', ',', '>', '<', '|', '¬', '¢', '£', '³', '²', '¹', '0', '1',
	                       '2', '3', '4', '5', '6', '7', '8', '9']

	      # Sad Paths
	      invalid_chars.each do |c|
	        @disciplina.nome = "Ban#{c}o de Dados" # invalid state
	        @disciplina.valid? # run validations
	        expect(@disciplina.errors[:nome]).to include('apenas letras e espaços')
	      end

	      # Happy Path
	      @disciplina.nome = "Banco de Dados" # valid state
	      @disciplina.valid? # run validations
	      expect(@disciplina.errors[:nome]).to_not include('apenas letras e espaços')
	    end

	    it ':c_prat deve conter apenas numeros' do
	      invalid_digit = ['1#', "fh.98.8a", 'sl4a 1s']

	      # Sad Paths
	      invalid_digit.each do |c|
	        @disciplina.c_prat = c                         # invalid state
	        expect(@disciplina.c_prat).to_not (be_an(Float))
	      end

	      # Happy Path
	      @disciplina.c_prat = 1
	      @disciplina.valid?
	      expect(@disciplina.errors[:c_prat]).to_not include('apenas numeros')
	    end

	    it ':c_teor deve conter apenas numeros' do
	      invalid_digit = ['1#', "fh.98.8a", 'sl4a 1s']

	      # Sad Paths
	      invalid_digit.each do |c|
	        @disciplina.c_teor = c                         # invalid state
	        expect(@disciplina.c_teor).to_not (be_an(Float))
	      end

	      # Happy Path
	      @disciplina.c_teor = 1
	      @disciplina.valid?
	      expect(@disciplina.errors[:c_teor]).to_not include('apenas numeros')
	    end

	    it ':c_est deve conter apenas numeros' do
	      invalid_digit = ['1#', "fh.98.8a", 'sl4a 1s']

	      # Sad Paths
	      invalid_digit.each do |c|
	        @disciplina.c_est = c                         # invalid state
	        expect(@disciplina.c_est).to_not (be_an(Float))
	      end

	      # Happy Path
	      @disciplina.c_est = 1
	      @disciplina.valid?
	      expect(@disciplina.errors[:c_est]).to_not include('apenas numeros')
	    end

	    it ':c_ext deve conter apenas numeros' do
	      invalid_digit = ['1#', "fh.98.8a", 'sl4a 1s']

	      # Sad Paths
	      invalid_digit.each do |c|
	        @disciplina.c_ext = c                         # invalid state
	        expect(@disciplina.c_ext).to_not (be_an(Float))
	      end

	      # Happy Path
	      @disciplina.c_ext = 1
	      @disciplina.valid?
	      expect(@disciplina.errors[:c_ext]).to_not include('apenas numeros')
	    end
  end

  describe '#all_tipos' do
    it 'should return an array with the Disciplina types' do
      @tipos = [['Obrigatória', 1], ['Optativa', 2]]
      expect(Disciplina.all_tipos).to eq @tipos
    end
  end
end