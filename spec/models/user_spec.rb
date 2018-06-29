# frozen_string_literal: true

require 'rails_helper'

describe User do
  fixtures :user

  before :each do
    @record = User.new
    @record.cpf = '12345678909'
  end

  describe '#name' do
    it 'should validate the presence of :name' do
      # Sad Path
      @record.name = ''                           # invalid state
      @record.valid?                              # run validations
      expect(@record.errors[:name]).to include("can't be blank")

      # Happy Path
      @record.name = 'Bernardo Costa Nascimento'  # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:name]).to_not include("can't be blank")
    end

    it 'should validate the length of :name' do
      # Sad Path 1
      @record.name = 'Ge'                         # invalid state
      @record.valid?                              # run validations
      expect(@record.errors[:name]).to include('is too short (minimum is 3 characters)')

      # Sad Path 2
      @record.name = 'Colocando um texto contendo mais de cinquenta caracteres' # invalid state
      @record.valid? # run validations
      expect(@record.errors[:name]).to include('is too long (maximum is 50 characters)')

      # Happy Path
      @record.name = 'Genaina Nunes Rodrigues'    # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:name]).to_not include('is too short (minimum is 3 characters)',
                                                   'is too long (maximum is 50 characters)')
    end

    it 'should validate the types of characters of :name' do
      invalid_chars = ["'", '"', '!', '@', '#', '$', '%', '*', '(', ')', '_',
                       '-', '+', '=', '§', '~', '^', '\\', '[', ']', '{', '}', '/', '?', '°',
                       ';', ':', '.', ',', '>', '<', '|', '¬', '¢', '£', '³', '²', '¹', '0', '1',
                       '2', '3', '4', '5', '6', '7', '8', '9']

      # Sad Paths
      invalid_chars.each do |c|
        @record.name = "Bernardo Co#{c}ta Nascimento" # invalid state
        @record.valid? # run validations
        expect(@record.errors[:name]).to include('only letters and spaces')
      end

      # Happy Path
      @record.name = 'Clarissa e Palos Brito'     # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:name]).to_not include('only letters and spaces')
    end
  end

  describe '#email' do
    it 'should validate the presence of :email' do
      # Sad Path
      @record.email = ''                          # invalid state
      @record.valid?                              # run validations
      expect(@record.errors[:email]).to include("can't be blank")

      # Happy Path
      @record.email = 'bernardoc1104@gmail.com'   # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:email]).to_not include("can't be blank")
    end

    it 'should validate the format of the :email' do
      invalid_formats = ['ber#as1104@gmail.com', 'bernas@unb\.br', 'bernas@unb_test.br']

      # Sad Paths
      invalid_formats.each do |email|
        @record.email = email                     # invalid state
        @record.valid?                            # run validations
        expect(@record.errors[:email]).to include('invalid email format')
      end

      # Happy Path
      @record.email = 'clapalos@outlook.com'      # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:email]).to_not include('invalid email format')
    end
  end

  describe '#cpf' do
    it 'should validate the presence of :cpf' do
      # Sad Path
      @record.cpf = ''                            # invalid state
      @record.valid?                              # run validations
      expect(@record.errors[:cpf]).to include("can't be blank")

      # Happy Path
      @record.cpf = '036'                         # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:cpf]).to_not include("can't be blank")
    end

    it 'should validate the length of :cpf' do
      invalid_length = %w[16635 1238697521 135976541385 45632185458798754]

      # Sad Paths
      invalid_length.each do |cpf|
        @record.cpf = cpf                         # invalid state
        @record.valid?                            # run validations
        expect(@record.errors[:cpf]).to include('is the wrong length (should be 11 characters)')
      end

      # Happy Path
      @record.cpf = '12345678901'                 # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:cpf]).to_not include('is the wrong length (should be 11 characters)')
    end

    it 'shoueld validate that the :cpf only has digits' do
      invalid_digit = ['163#1375#82', '036.384.811-82', 'ska3kl4a 1sa']

      # Sad Paths
      invalid_digit.each do |cpf|
        @record.cpf = cpf                         # invalid state
        @record.valid?                            # run validations
        expect(@record.errors[:cpf]).to include('only numbers')
      end

      # Happy Path
      @record.cpf = '15935745682'
      @record.valid?
      expect(@record.errors[:cpf]).to_not include('only numbers')
    end

    it 'should validate the :cpf number' do
      invalid_cpf = %w[03638481181 12345678910]

      # Sad Path
      invalid_cpf.each do |cpf|
        @record.cpf = cpf                         # invalid state
        @record.valid?                            # run validations
        expect(@record.errors[:cpf]).to include('is invalid')
      end

      # Happy Path
      @record.cpf = '12345678909'
      @record.valid?
      expect(@record.errors[:cpf]).to_not include('is invalid')
    end
  end

  describe '#rg' do
    it 'should validate the presence of :rg' do
      # Sad Path
      @record.rg = ''                             # invalid state
      @record.valid?                              # run validations
      expect(@record.errors[:rg]).to include("can't be blank")

      # Happy Path
      @record.rg = '1'                            # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:rg]).to_not include("can't be blank")
    end

    it 'should validate the length of :rg' do
      # Sad Path
      @record.rg = '13249'                        # invalid state
      @record.valid?                              # run validations
      expect(@record.errors[:rg]).to include('is too short (minimum is 7 characters)')

      # Happy Path
      @record.rg = '1326975'                      # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:rg]).to_not include('is too short (minimum is 7 characters')
    end

    it 'should validate the digits of :rg' do
      invalid_rg = ['1654@21', '246 8956', 'djaskl1']

      # Sad Path
      invalid_rg.each do |rg|
        @record.rg = rg                           # invalid state
        @record.valid?                            # run validations
        expect(@record.errors[:rg]).to include('only numbers')
      end

      # Happy Path
      @record.rg = '2645178'                      # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:rg]).to_not include('only numbers')
    end
  end

  describe '#matricula' do
    it 'should validate the presence of :matricula' do
      # Sad Path
      @record.matricula = ''                      # invalid state
      @record.valid?                              # run validations
      expect(@record.errors[:matricula]).to include("can't be blank")

      # Happy Path
      @record.matricula = '1'                     # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:matricula]).to_not include("can't be blank")
    end

    it 'should validate the length of :matricula' do
      invalid_length = %w[15935782 1593578524 1234 132548753654]

      # Sad Path
      invalid_length.each do |matricula|
        @record.matricula = matricula             # invalid state
        @record.valid?                            # run validations
        expect(@record.errors[:matricula]).to include('is the wrong length (should be 9 characters)')
      end

      @record.matricula = '123456789'             # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:matricula]).to_not include('is the wrong length (should be 9 characters)')
    end

    it 'should validate the format of :matricula' do
      invalid_format = ['213 890#1', 'asd 78sa#1', 'jsdaklwqu']

      # Sad Path
      invalid_format.each do |matricula|
        @record.matricula = matricula             # invalid state
        @record.valid?                            # run validations
        expect(@record.errors[:matricula]).to include('only numbers')
      end

      # Happy Path
      @record.matricula = '1400802790'            # valid state
      @record.valid?                              # run validations
      expect(@record.errors[:matricula]).to_not include('only numbers')
    end
  end

  describe 'validations of uniqueness on the database' do
    it 'validates that a new user has unique :email' do
      # Sad Path
      invalid_user = User.create(email: 'bernardoc1104@gmail.com', cpf: '12345678909')
      expect(invalid_user.errors[:email]).to include('has already been taken')

      # Happy Path
      valid_user = User.create(email: 'clapalos@outlook.com', cpf: '12345678909')
      expect(valid_user.errors[:email]).to_not include('has already been taken')
    end

    it 'validates that a new user has unique :cpf' do
      # Sad Path
      invalid_user = User.create(cpf: '03638481182')
      expect(invalid_user.errors[:cpf]).to include('has already been taken')

      valid_user = User.create(cpf: '12345678901')
      expect(valid_user.errors[:cpf]).to_not include('has already been taken')
    end

    it 'validates that a new user has unique :rg' do
      invalid_user = User.create(rg: '2645178', cpf: '12345678909')
      expect(invalid_user.errors[:rg]).to include('has already been taken')

      valid_user = User.create(rg: '1953467', cpf: '12345678909')
      expect(valid_user.errors[:rg]).to_not include('has already been taken')
    end

    it 'validates that a new user has unique :matricula' do
      invalid_user = User.create(matricula: '140080279', cpf: '12345678909')
      expect(invalid_user.errors[:matricula]).to include('has already been taken')

      valid_user = User.create(matricula: '141237954', cpf: '12345678909')
      expect(valid_user.errors[:matricula]).to_not include('has already been taken')
    end
  end
end
