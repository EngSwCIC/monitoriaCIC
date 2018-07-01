# frozen string literal: true

require 'rails_helper'

describe DadosBancarios do
  before :each do
    @record = DadosBancarios.new
  end

  describe '#codigo' do
    it 'validates the presence of' do
      # Happy Path
      @record.codigo = 'Banco do Brasil'
      @record.valid?
      expect(@record.errors[:codigo]).to_not include("can't be blank")

      # Sad Path
      @record.codigo = ''
      @record.valid?
      expect(@record.errors[:codigo]).to include("can't be blank")
    end

    it 'validates the length of' do
      # Happy Path
      @record.codigo = 'NuBank'
      @record.valid?
      expect(@record.errors[:codigo]).to_not include(
        "is too short (minimum is 6 characters)",
        "is too long (maximum is 25 characters)"
      )

      # Sad Path 1
      @record.codigo = 'Bank'
      @record.valid?
      expect(@record.errors[:codigo]).to include("is too short (minimum is 6 characters)")

      # Sad Path 2
      @record.codigo = 'Banco Para Testar Que O Limite É 25 Caracteres'
      @record.valid?
      expect(@record.errors[:codigo]).to include("is too long (maximum is 25 characters)")
    end

    it 'validates the format of' do
      # Happy Path
      @record.codigo = 'Banco Itaú'
      @record.valid?
      expect(@record.errors[:codigo]).to_not include("only letters and spaces")

      # Sad Path
      @record.codigo = 'B4nc0 !t#u'
      @record.valid?
      expect(@record.errors[:codigo]).to include("only letters and spaces")
    end
  end

  describe '#agencia' do
    it 'validates the presence of' do
      # Happy Path
      @record.agencia = '38102'
      @record.valid?
      expect(@record.errors[:agencia]).to_not include("can't be blank")

      # Sad Path
      @record.agencia = ''
      @record.valid?
      expect(@record.errors[:agencia]).to include("can't be blank")
    end

    it 'validates the format of' do
      # Happy Path
      @record.agencia = '33804'
      @record.valid?
      expect(@record.errors[:agencia]).to_not include("only numbers")

      # Sad Path
      @record.agencia = '3O383'
      @record.valid?
      expect(@record.errors[:agencia]).to include("only numbers")
    end
  end

  describe '#conta_corrente' do
    it 'validates the presence of' do
      # Happy Path
      @record.conta_corrente = '394653'
      @record.valid?
      expect(@record.errors[:conta_corrente]).to_not include("can't be blank")

      # Sad Path
      @record.conta_corrente = ''
      @record.valid?
      expect(@record.errors[:conta_corrente]).to include("can't be blank")
    end

    it 'validates the format of' do
      # Happy Path
      @record.conta_corrente = '294935'
      @record.valid?
      expect(@record.errors[:conta_corrente]).to_not include("only numbers")

      # Sad Path
      @record.conta_corrente = '3O7 #2'
      @record.valid?
      expect(@record.errors[:conta_corrente]).to include("only numbers")
    end
  end
end