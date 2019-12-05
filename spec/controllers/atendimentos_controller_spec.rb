# frozen string literal: true

require 'rails_helper'

describe AtendimentosController do
    describe '#new' do
      it 'should render the views/atendimentos/new.html.erb' do
        get :new
        expect(response).to render_template(:new)
      end
    end
    describe '#create' do
    before :each do
            @info = {
                motivo_id: 1,
                aluno_atendido: 'Teste do controller create em rspec',
                dia: '2019-12-11',
                descricao: '140080279'
            }

            @params = Hash.new
            @params[:atendimento] = @info
    end
        it 'should call the controller method that filters the form input' do

            expect_any_instance_of(AtendimentosController).to receive(:atendimento_params)
                .and_return(@params[:atendimento])
            post :create, params: @params
        end

        it 'should call the model method that creates the Atendimentos' do
            ActionController::Parameters.permit_all_parameters = true
            @atendimentos = ActionController::Parameters.new(@params[:atendimento])

            expect(Atendimentos).to receive(:create).with(@atendimentos)
                .and_return(Atendimento.create(@atendimentos))
            post :create, params: @params
        end

        it 'should redirect the user to the Dashboard page' do
            post :create, params: @params
            expect(flash[:notice]).to eq('Registro de atendimento realizado com sucesso!')
            expect(subject).to redirect_to '/dashboard/atendimentos'
        end
  end
end
