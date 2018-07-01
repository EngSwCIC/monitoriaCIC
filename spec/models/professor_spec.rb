# frozen string literal: true

require 'rails_helper'

describe Professor do
  describe 'validations for name' do
    before :each do
      @record = Professor.new
    end

    it 'validates the presence of' do
      # Happy Path
      @record.name = 'Genaina Nunes Rodrigues'
      @record.valid?
      expect(@record.errors[:name]).to_not include("can't be blank")

      # Sad Path
      @record.name = ''
      @record.valid?
      expect(@record.errors[:name]).to include("can't be blank")
    end

    it 'validates the length of' do
      # Happy Path
      @record.name = 'Rodrigo Bonifácio'
      @record.valid?
      expect(@record.errors[:name]).to_not include(
        "is too short (minimum is 3 characters)",
        "is too long (maximum is 50 characters)"
      )

      # Sad Path 1
      @record.name = 'R'
      @record.valid?
      expect(@record.errors[:name]).to include("is too short (minimum is 3 characters)")

      # Sad Path 2
      @record.name = 'Pedro Enriqqui Kelvin Thor Marinho Ribeiro Blower Brito'
      @record.valid?
      expect(@record.errors[:name]).to include("is too long (maximum is 50 characters)")
    end

    it 'validates the format of' do
      # Happy Path
      @record.name = 'Clarissa E Palos Brito'
      @record.valid?
      expect(@record.errors[:name]).to_not include("only letters and spaces")

      # Sad Path 1
      @record.name = 'Cl4r1ss4 E Palos Brito'
      @record.valid?
      expect(@record.errors[:name]).to include("only letters and spaces")

      # Sad Path 2
      @record.name = 'Clarissa_E_Pal#s_B#1%$'
      @record.valid?
      expect(@record.errors[:name]).to include("only letters and spaces")
    end
  end

  describe 'validations for email' do
    fixtures 'professor'

    before :each do
      @record = Professor.new
    end

    it 'validates the presence of' do
      # Happy Path
      @record.email = 'genaina@unb.br'
      @record.valid?
      expect(@record.errors[:email]).to_not include("can't be blank")

      # Sad Path
      @record.email = ''
      @record.valid?
      expect(@record.errors[:email]).to include("can't be blank")
    end

    it 'validates the format of' do
      # Happy Path
      @record.email = 'rbonifacio@unb.br'
      @record.valid?
      expect(@record.errors[:email]).to_not include("not a UnB email")

      # Sad Path
      @record.email = 'bernardoc1104@gmail.com'
      @record.valid?
      expect(@record.errors[:email]).to include("not a UnB email")
    end

    it 'validates the uniqueness of' do
      # Happy Path
      @record.email = 'bernardo@unb.br'
      @record.valid?
      expect(@record.errors[:email]).to_not include("has already been taken")

      # Sad Path
      @record.email = 'rbonifacio@unb.br'
      @record.valid?
      expect(@record.errors[:email]).to include("has already been taken")
    end
  end

  describe 'validations for username' do
    before :each do
      @record = Professor.new
    end

    it 'validates the presence of' do
      # Happy Path
      @record.username = 'bernas1104'
      @record.valid?
      expect(@record.errors[:username]).to_not include("can't be blank")

      # Sad Path
      @record.username = ''
      @record.valid?
      expect(@record.errors[:username]).to include("can't be blank")
    end

    it 'validates the uniqueness of' do
      # Happy Path
      @record.username = 'clapalos'
      @record.valid?
      expect(@record.errors[:username]).to_not include('has already been taken')

      # Sad Path
      @record.username = 'grodrigues'
      @record.valid?
      expect(@record.errors[:username]).to include('has already been taken')
    end

    it 'validates the length of' do
      # Happy Path
      @record.username = 'rbonifacio'
      @record.valid?
      expect(@record.errors[:username]).to_not include('is too short (minimum is 3 characters)',
                                                       'is too long (maximum is 15 characters)')

      # Sad Path 1
      @record.username = 'rb'
      @record.valid?
      expect(@record.errors[:username]).to include('is too short (minimum is 3 characters)')

      # Sad Path 2
      @record.username = 'rodrigobonifaciouseratunb'
      @record.valid?
      expect(@record.errors[:username]).to include('is too long (maximum is 15 characters)')
    end

    it 'validates the format of' do
      # Happy Path
      @record.username = 'vibeatriz_05'
      @record.valid?
      expect(@record.errors[:username]).to_not include('only word characters (letters, numbers, underscore...)')

      # Sad Path
      @record.username = 'v!b&atriz_05'
      @record.valid?
      expect(@record.errors[:username]).to include('only word characters (letter, numbers, underscore...)')
    end
  end

  describe '#all_roles' do
    it 'should return an array for professor titles and their values' do
      @roles = [['Professor(a) substituto(a)', 1], ['Professor(a)', 2], ['Professor(a) Colaborador(a)', 3],
                ['Professor(a) Adjunto(a)', 4], ['Professor(a) Associado(a)', 5], ['Professor(a) Titular', 6]]

      expect(Professor.all_roles).to eq @roles
    end
  end
end