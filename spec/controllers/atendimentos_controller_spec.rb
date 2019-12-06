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
                aluno_atendido: 'Cristiane',
                dia: '2019-12-11',
                descricao: '150008023',
                monitor_id: '',
                motivo_id: ''
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

            expect(Atendimento).to receive(:create).with(@atendimentos)
                .and_return(Atendimento.create(@atendimentos))
            post :create, params: @params
        end

        it 'should redirect the user to the Dashboard page' do
            post :create, params: @params

            expect(flash[:notice]).to eq('Registro de atendimento realizado com sucesso!')
            
            expect(subject).to redirect_to '/dashboard/atendimentos'
        end

        it 'tries to create Atendimento with invalid information' do
            ActionController::Parameters.permit_all_parameters = true
            @atendimento = ActionController::Parameters.new(@params[:atendimento])
    
            expect(Atendimento).to receive(:create).with(@atendimento)
              .and_return(Atendimento.create(@atendimentos))
    
            post :create, params: @params
            expect(flash[:danger]).to include(
              "Dia can't be blank",
              "Motivo can't be blank",
              "Monitor can't be blank"
            )
            expect(subject).to redirect_to ('/dashboard/atendimentos')
        end
    end

    describe '#update' do
        
        before :each do
            @info = {
                descricao: 'Descricao alterada'
            }
    
            @params = Hash.new
            @params[:atendimento] = @info
            @params[:id] = "1"
    
            @db_atendimentos = FactoryBot.create(:atendimento, id: 1)
        end

        it 'should call the instance method that updates the Atendimento attributes' do
            ActionController::Parameters.permit_all_parameters = true
            @atendimentos_params = ActionController::Parameters.new(@params[:atendimento])
    
            allow(Atendimento).to receive(:find).with(@params[:id]).and_return(@db_atendimentos)
            expect(@db_atendimentos).to receive(:update_attributes).with(@atendimentos_params)
            .and_return(@db_atendimentos.update_attributes(@atendimentos_params))
            put :update, params: @params
        end
  
        it 'should set de flash and redirect the user to the Atendimentos page' do
            allow(Atendimento).to receive(:find).with(@params[:id]).and_return(@db_atendimentos)
            put :update, params: @params
            expect(flash[:notice]).to eq('Atendimento atualizado com sucesso!')
            expect(subject).to redirect_to('/dashboard/atendimentos')
        end
    end
  
    describe '#update sad path' do
        before :each do
            @invalid_info = {
                dia: ''
            }
    
            @params = Hash.new
            @params[:atendimento] = @invalid_info
            @params[:id] = "1"
    
            @db_atendimentos = FactoryBot.create(:atendimento, id: 1)
        end
  
        it 'tries to update a Atendimento with invalid information' do
            ActionController::Parameters.permit_all_parameters = true
            @atendimentos_params = ActionController::Parameters.new(@params[:atendimento])
    
            allow(Atendimento).to receive(:find).with(@params[:id]).and_return(@db_atendimentos)
            expect(@db_atendimentos).to receive(:update_attributes).with(@atendimentos_params)
                .and_return(@db_atendimentos.update_attributes(@atendimentos_params))
            put :update, params: @params
            expect(flash[:danger]).to include(
                "can't be blank"
            )
            expect(subject).to redirect_to('/dashboard/atendimentos')
        end
    end

    describe '#destroy' do
        before :each do
            @params = {}
            @params[:id] = "1"
            
            @db_atendimentos = FactoryBot.create(:atendimento, id: 1)
        end
  
  
        it 'calls the model method that finds the  Atendimento' do
          expect(Atendimento).to receive(:find).with(@params[:id])
            .and_return(@db_atendimentos)
          delete :destroy, params: @params
        end
  
        it 'calls the instance method that deletes the Atendimento' do
          allow(Atendimento).to receive(:find).with(@params[:id]).and_return(@db_atendimentos)
          expect(@db_atendimentos).to receive(:delete).and_return(@db_atendimentos.delete)
          delete :destroy, params: @params
        end
  
        it 'should set the flash and redirect the user' do
          delete :destroy, params: @params
          expect(flash[:notice]).to eq('Atendimento apagado com sucesso!')
          expect(subject).to redirect_to('/dashboard/atendimentos')
        end
    end
end
