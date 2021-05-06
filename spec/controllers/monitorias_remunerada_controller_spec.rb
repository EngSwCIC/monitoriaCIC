# frozen string literal: true

require 'rails_helper'

describe MonitoriasRemuneradaController do
  before :each do
    allow_any_instance_of(MonitoriasRemuneradaController).to receive(:logged_in).and_return(true)
  end

  describe 'PUT #update' do
    describe 'happy path' do
      before :each do
        @db_monitoria = FactoryBot.create(:monitoria, id: '1')
        @info = {
          remuneracao: 'Remunerado',
          fk_matricula: '140080384',
          fk_cod_disciplina: '1',
          fk_turmas_id: '1',
          descricao_status: 'Nota: SS, IRA: 3',
          prioridade: '1',
          fk_status_monitoria_id: '1'
        }

        @params = {}
        @params[:monitoria] = @info
        @params[:id] = '1'
      end

      it 'Procura a monitoria no banco de dados' do
        expect(Monitoria).to receive(:find).with(@params[:id]).and_return(@db_monitoria)
        put :update, params: @params
      end

      it 'Tesde de #monitoria_params' do
        allow(Monitoria).to receive(:find).and_return(@db_monitoria)
        expect_any_instance_of(MonitoriasRemuneradaController).to receive(:monitoria_params).and_return(@params[:monitoria])
        put :update, params: @params
      end

      it 'Edita o status de monitoria do banco' do
        expect(@db_monitoria.update(:fk_status_monitoria_id => '2')).to be true
      end

      it 'Sinaliza e realoca o usuario para a pagina de monitoria remunerada' do
        allow(Monitoria).to receive(:find).and_return(@db_monitoria)
        put :update, params: @params
        expect(flash[:notice]).to eq('Situaçao atualizada!')
        expect(subject).to redirect_to('/dashboard/monitoria_remunerada')
      end
    end
  end

end