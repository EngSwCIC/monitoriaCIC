# frozen string literal: true

require 'rails_helper'

describe Turma do
  describe 'validations' do
    before :each do
      @record = Turma.new
    end

    it 'validates :turma' do
      # Happy Path
      @record.turma = 'A'
      @record.valid?
      expect(@record.errors[:turma]).to_not include("can't be blank")

      # Sad Path
      @record.turma = ''
      @record.valid?
      expect(@record.errors[:turma]).to include("can't be blank")
    end

    it 'validates :professor' do
      # Happy Path
      @record.professor = 'Genaina Nunes Rodrigues'
      @record.valid?
      expect(@record.errors[:professor]).to_not include("can't be blank")

      # Sad Path
      @record.professor = ''
      @record.valid?
      expect(@record.errors[:professor]).to include("can't be blank")
    end

    it 'validates :fk_cod_disciplina' do
      # Happy Path
      @record.fk_cod_disciplina = '113468'
      @record.valid?
      expect(@record.errors[:fk_cod_disciplina]).to_not include("can't be blank")

      # Sad Path
      @record.fk_cod_disciplina = ''
      @record.valid?
      expect(@record.errors[:fk_cod_disciplina]).to include("can't be blank")
    end

    it 'validates :qnt_bolsas' do
      # Happy Path
      @record.qnt_bolsas = 3
      @record.valid?
      expect(@record.errors[:qnt_bolsas]).to_not include("can't be blank")

      # Sad Path
      @record.qnt_bolsas = nil
      @record.valid?
      expect(@record.errors[:qnt_bolsas]).to include("can't be blank")
    end
  end

  describe '#turma_unica' do
    before :each do
      @disciplina = FactoryBot.create(:disciplina, cod_disciplina: '1')
      @db_turma = FactoryBot.create(:turma, fk_cod_disciplina: '1')
    end

    it "shouldn't return an error if the Turma is unique for a given Disciplina" do
      @turma = FactoryBot.create(:turma, id: '2', fk_cod_disciplina: '1', turma: 'B')
      expect(@turma.errors[:turma]).to_not include("B não é a única para a disciplina Engenharia de Software")
    end

    it "should return an error if the Turma isn't unique for a given Disciplina" do
      @turma = FactoryBot.build(:turma, id: '2', fk_cod_disciplina: '1', turma: 'A')
      @turma.valid?
      expect(@turma.errors[:turma]).to include("A não é a única para a disciplina Engenharia de Software")
    end
  end

  describe '#qnt_bolsas' do
    it 'should return an array of integers' do
      @array = []
      for n in 1..10
        rst = [n.to_s, n]
        @array << rst
      end
      expect(Turma.qnt_bolsas).to eq(@array)
    end
  end

  describe '#sel_disciplinas' do
    before :each do
      @d1 = FactoryBot.create(:disciplina, cod_disciplina: 1, nome: 'Disciplina I')
      @d2 = FactoryBot.create(:disciplina, cod_disciplina: 2, nome: 'Disciplina II')
      @d3 = FactoryBot.create(:disciplina, cod_disciplina: 3, nome: 'Disciplina III')
    end

    it 'should return an array of all the Disciplinas nomes and cod_disciplinas' do
      expect(Turma.sel_disciplinas).to eq([['Disciplina I', 1], ['Disciplina II', 2], ['Disciplina III', 3]])
    end
  end

  describe '#show_disciplinas' do
    before :each do
      @d1 = FactoryBot.create(:disciplina, cod_disciplina: 1, nome: 'Disciplina I')
      @d2 = FactoryBot.create(:disciplina, cod_disciplina: 2, nome: 'Disciplina II')
      @d3 = FactoryBot.create(:disciplina, cod_disciplina: 3, nome: 'Disciplina III')
    end

    it 'should return an array with all the Disciplinas nomes' do
      expect(Turma.show_disciplinas).to eq(['Disciplina I', 'Disciplina II', 'Disciplina III'])
    end
  end

  describe '#sel_turmas' do
    it 'should return an array with all the Turmas :turmas' do
      expect(Turma.sel_turmas).to eq(['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                                     'AA', 'BB', 'CC', 'DD', 'EE', 'FF', 'GG', 'HH'])
    end
  end

  describe '#all_turmas' do
    before :each do
      @disciplina = FactoryBot.create(:disciplina, cod_disciplina: '1')
      @turma1 = FactoryBot.create(:turma, id: 1, fk_cod_disciplina: '1', turma: 'A')
      @turma2 = FactoryBot.create(:turma, id: 2, fk_cod_disciplina: '1', turma: 'B')
    end

    it 'should return an array with all the Turmas' do
      @turmas = Turma.find_each
      expect(Turma.all_turmas).to match_array(@turmas)
    end
  end
end