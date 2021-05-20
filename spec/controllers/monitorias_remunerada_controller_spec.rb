# frozen string literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

describe MonitoriasRemuneradaController do  
  describe 'PUT #update' do
    describe 'happy path' do
      before :each do
        @db_monitoria = FactoryBot.create(:monitoria, id: '1')
        @info = {
          remuneracao: 'Remunerado',
          fk_matricula: '140080384',
          fk_cod_disciplina: '113468',
          fk_turmas_id: '1',
          descricao_status: 'Nota: SS, IRA: 3',
          prioridade: '1',
          fk_status_monitoria_id: '1'
        }
        @turma = FactoryBot.create(:turma, id: '1')

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

      it 'Edita o status de monitoria do banco para recusado' do
        expect(@db_monitoria.update(:fk_status_monitoria_id => '2')).to be true
      end

      it 'Sinaliza e realoca o usuario para a pagina de monitoria remunerada' do
        allow(Monitoria).to receive(:find).and_return(@db_monitoria)
        put :update, params: @params
        expect(flash[:notice]).to eq('Situaçao atualizada!')
        expect(subject).to redirect_to('/dashboard/monitoria_remunerada')
      end

      it 'Atualiza a quantidade de bolsas caso a monitoria seja aceita' do
        @db_monitoria.update(:fk_status_monitoria_id => '3')
        put :update, params: @params
        expect(Turma.find_by_id(1).qnt_bolsas).to eq(3)
      end

    end

  end

  describe "#find_monitor" do
    it "encontra as aplicaçoes para monitor em uma turma" do
      @monitoria = FactoryBot.create(:monitoria, id: '1')
      @monitoria.save
      monitoria = Monitoria.where(fk_turmas_id: '1')
      expect(monitoria).to include(@monitoria) 
    end
  end

  describe 'GET #show' do
      it 'render show template' do
        get :show
        expect(response).to render_template(:show)
      end
    end

end
