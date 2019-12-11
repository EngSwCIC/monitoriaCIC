# frozen string literal: true

require 'rails_helper'

describe AtividadesController do
  describe 'User Logged' do
    before :each do
      allow_any_instance_of(AtividadesController).to receive(:user_logged).and_return(true)
    end

    describe '#new' do
      it 'should render the views/atividades/new.html.erb' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe '#create' do
      before :each do
        @info = {
          titulo: 'Titulo teste',
          mensagem: 'Teste do controller create em rspec',
          data: '2019-12-11',
          matricula_monitor: '140080279'
        }

        @params = Hash.new
        @params[:atividade] = @info
      end

      it 'should call the controller method that filters the form input' do

        expect_any_instance_of(AtividadesController).to receive(:atividade_params)
          .and_return(@params[:atividade])
        post :create, params: @params
      end

      it 'should call the model method that creates the Atividade' do
        ActionController::Parameters.permit_all_parameters = true
        @atividades = ActionController::Parameters.new(@params[:atividade])

        expect(Atividade).to receive(:create).with(@atividades)
          .and_return(Atividade.create(@atividades))
        post :create, params: @params
      end

      it 'should redirect the user to the Dashboard page' do
        post :create, params: @params
        expect(flash[:notice]).to eq('Registro de atividade realizado com sucesso!')
        expect(subject).to redirect_to '/dashboard/atividades'
      end
    end

    describe '#create sad path' do
      before :each do
        @info = {
          titulo: '',
          mensagem: 'mensagem sad path',
          data: '2019-12-11',
          matricula_monitor: '123456789'
        }

        @params = Hash.new
        @params[:atividade] = @info
      end

      it 'tries to create a Atividade with invalid information' do
        ActionController::Parameters.permit_all_parameters = true
        @atividades_params = ActionController::Parameters.new(@params[:atividade])

        expect(Atividade).to receive(:create).with(@atividades_params)
          .and_return(Atividade.create(@atividades_params))

        post :create, params: @params
        expect(flash[:danger]).to include(
          "Campo obrigatório 'Título' não preenchido! Registro não realizado."
        )
        expect(subject).to redirect_to ('/dashboard/atividades')
      end
    end

    describe '#update' do
      before :each do
        @info = {
          titulo: 'Tiulo alterado',
          mensagem: 'mensagem alterada',
        }

        @params = Hash.new
        @params[:atividade] = @info
        @params[:id] = "1"

        @db_atividades = FactoryBot.create(:atividade, id: 1)
      end

      it 'should call the instance method that updates the Atividade attributes' do
        ActionController::Parameters.permit_all_parameters = true
        @atividades_params = ActionController::Parameters.new(@params[:atividade])

        allow(Atividade).to receive(:find).with(@params[:id]).and_return(@db_atividades)
        expect(@db_atividades).to receive(:update_attributes).with(@atividades_params)
          .and_return(@db_atividades.update_attributes(@atividades_params))
        put :update, params: @params
      end

      it 'should set de flash and redirect the user to the Dados Bancarios page' do
        allow(Atividade).to receive(:find).with(@params[:id]).and_return(@db_atividades)
        put :update, params: @params
        expect(flash[:notice]).to eq('Atividade atualizada com sucesso!')
        expect(subject).to redirect_to('/dashboard/atividades')
      end
    end

    describe '#update sad path' do
      before :each do
        @invalid_info = {
          titulo: '',
          mensagem: 'mensagem sad path'
        }

        @params = Hash.new
        @params[:atividade] = @invalid_info
        @params[:id] = "1"

        @db_atividades = FactoryBot.create(:atividade, id: 1)
      end

      it 'tries to update a Atividade with invalid information' do
        ActionController::Parameters.permit_all_parameters = true
        @atividades_params = ActionController::Parameters.new(@params[:atividade])

        allow(Atividade).to receive(:find).with(@params[:id]).and_return(@db_atividades)
        expect(@db_atividades).to receive(:update_attributes).with(@atividades_params)
          .and_return(@db_atividades.update_attributes(@atividades_params))
        put :update, params: @params
        expect(flash[:danger]).to include(
          "Campo obrigatório 'Título' não preenchido! Registro não realizado."
        )
        expect(subject).to redirect_to('/dashboard/atividades')
      end
    end

    describe '#destroy' do
      before :each do
        @params = {}
        @params[:id] = "1"

        @db_atividades = FactoryBot.create(:atividade, id: 1)
      end


      it 'calls the model method that finds the  Atividade' do
        expect(Atividade).to receive(:find).with(@params[:id])
          .and_return(@db_atividades)
        delete :destroy, params: @params
      end

      it 'calls the instance method that deletes the Atividade' do
        allow(Atividade).to receive(:find).with(@params[:id]).and_return(@db_atividades)
        expect(@db_atividades).to receive(:delete).and_return(@db_atividades.delete)
        delete :destroy, params: @params
      end

      it 'should set the flash and redirect the user' do
        delete :destroy, params: @params
        expect(flash[:notice]).to eq('Atividade apagada com sucesso!')
        expect(subject).to redirect_to('/dashboard/atividades')
      end
    end
  end
end