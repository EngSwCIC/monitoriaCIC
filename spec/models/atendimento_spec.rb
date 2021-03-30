require 'rails_helper'

describe Atendimento do

    before :each do
        @record = Atendimento.new
        @record.monitor_id = 1
    end

    describe '#monitor_id' do
        it 'should validate the presence of :monitor_id' do
            # Sad Path
            @record.monitor_id = ''                   # invalid state
            @record.valid?                            # run validations
            expect(@record.errors[:monitor_id]).to include("can't be blank")
      
            # Happy Path
            @record.monitor_id = 1  # valid state
            @record.valid?                              # run validations
            expect(@record.errors[:monitor_id]).to_not include("can't be blank")
        end
    end

    describe '#motivo' do
        it 'should validate the presence of :motivo_id' do
            # Sad Path
            @record.motivo_id = ''                   # invalid state
            @record.valid?                            # run validations
            expect(@record.errors[:motivo_id]).to include("can't be blank")
      
            # Happy Path
            @record.motivo_id = 1  # valid state
            @record.valid?                              # run validations
            expect(@record.errors[:motivo_id]).to_not include("can't be blank")
        end
    end

    describe '#dia' do
        it 'should validate the presence of :dia' do
            # Sad Path
            @record.dia = ''                   # invalid state
            @record.valid?                            # run validations
            expect(@record.errors[:dia]).to include("can't be blank")
      
            # Happy Path
            @record.dia = '03/12/2019'  # valid state
            @record.valid?                              # run validations
            expect(@record.errors[:dia]).to_not include("can't be blank")
        end
    end

    describe '#descricao' do
        it 'should not validate the presence of :descricao' do
            @record.descricao = ''  # valid state
            @record.valid?                              # run validations
            expect(@record.errors[:descricao]).to_not include("can't be blank")
        end
    end

    describe '#aluno_atendido' do
        it 'should not validate the presence of :aluno_atendido' do
            @record.aluno_atendido = ''  # valid state
            @record.valid?                              # run validations
            expect(@record.errors[:aluno_atendido]).to_not include("can't be blank")
        end
    end

end