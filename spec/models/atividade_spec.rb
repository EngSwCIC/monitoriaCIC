# frozen string literal: true

require 'rails_helper'

describe Atividade do
  before :each do
    @record = Atividade.new
  end

  describe '#titulo' do
    it 'validates the presence of' do
      # Happy Path
      @record.titulo = 'Titulo de teste'
      @record.valid?
      expect(@record.errors[:titulo]).to_not include("Campo obrigatório 'Título' não preenchido! Registro não realizado.")

      # Sad Path
      @record.titulo = ''
      @record.valid?
      expect(@record.errors[:titulo]).to include("Campo obrigatório 'Título' não preenchido! Registro não realizado.")
    end
  end

  describe '#mensagem' do 
    it 'validates the presence of' do
      # Happy Path
      @record.mensagem = 'mensagem de teste'
      @record.valid?
      expect(@record.errors[:mensagem]).to_not include("Campo obrigatório 'Descrição' não preenchido! Registro não realizado.")

      # Sad Path
      @record.mensagem = ''
      @record.valid?
      expect(@record.errors[:mensagem]).to include("Campo obrigatório 'Descrição' não preenchido! Registro não realizado.")
    end
  end

  describe '#data' do 
    it 'validates the presence of' do
      # Happy Path
      @record.data = '2019-12-10'
      @record.valid?
      expect(@record.errors[:data]).to_not include("Campo obrigatório 'Data' não preenchido! Registro não realizado.")

      # Sad Path
      @record.data = ''
      @record.valid?
      expect(@record.errors[:data]).to include("Campo obrigatório 'Data' não preenchido! Registro não realizado.")
    end
  end

  describe '#matricula_monitor' do 
    it 'validates the presence of' do
      # Happy Path
      @record.matricula_monitor = '123456789'
      @record.valid?
      expect(@record.errors[:matricula_monitor]).to_not include("Campo obrigatório 'Matrícula' não preenchido! Registro não realizado.")

      # Sad Path
      @record.matricula_monitor = ''
      @record.valid?
      expect(@record.errors[:matricula_monitor]).to include("Campo obrigatório 'Matrícula' não preenchido! Registro não realizado.")
    end
  end

end