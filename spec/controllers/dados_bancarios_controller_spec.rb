# frozen string literal: true

require 'rails_helper'

describe DadosBancariosController do
  describe 'User Logged' do
    before :each do
      allow_any_instance_of(DadosBancariosController).to receive(:user_logged).and_return(true)
    end

    describe '#new' do
      it 'should render the views/dados_bancarios/new.html.haml' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe '#create' do
      before :each do
        @info = {
          codigo: 'Banco do Brasil',
          agencia: '33804',
          conta_corrente: '394653'
        }

        @params = Hash.new
        @params[:dados_bancarios] = @info
      end

      it 'should call the controller method that filters the form input' do
        @user = FactoryBot.build(:user)

        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@user)
        expect_any_instance_of(DadosBancariosController).to receive(:dados_bancarios_params)
          .and_return(@params[:dados_bancarios])
        post :create, params: @params
      end

      it 'should call the model method that creates the Dados Bancarios' do
        @user = FactoryBot.build(:user)
        ActionController::Parameters.permit_all_parameters = true
        @dados_bancarios = ActionController::Parameters.new(@params[:dados_bancarios])

        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
         .and_return(@user)

        expect(DadosBancarios).to receive(:create).with(@dados_bancarios)
          .and_return(DadosBancarios.create(@dados_bancarios))
        post :create, params: @params
      end

      it 'should call the model method that finds the created Dados Bancarios' do
        @user = FactoryBot.build(:user)

        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@user)
        expect(DadosBancarios).to receive(:find_by).and_return(@user)
        post :create, params: @params
      end

      it 'should call the model method that updates the User with its new Dados Bancarios' do
        @user = FactoryBot.build(:user)

        expect_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@user)
        expect(@user).to receive(:update).with(fk_banco: 1).and_return(@user.update(fk_banco: 1))
        post :create, params: @params
      end

      it 'should redirect the user to the Dashboard page' do
        @user = FactoryBot.build(:user)

        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
         .and_return(@user)
        post :create, params: @params
        expect(flash[:notice]).to eq('Dados bancários cadastrados com sucesso!')
        expect(subject).to redirect_to '/dashboard/dados_bancarios'
      end
    end

    describe '#create sad path' do
      before :each do
        @info = {
          codigo: '',
          agencia: '',
          conta_corrente: ''
        }

        @params = Hash.new
        @params[:dados_bancarios] = @info
      end

      it 'tries to create a Dados Bancarios with invalid information' do
        ActionController::Parameters.permit_all_parameters = true
        @dados_bancarios_params = ActionController::Parameters.new(@params[:dados_bancarios])

        expect(DadosBancarios).to receive(:create).with(@dados_bancarios_params)
          .and_return(DadosBancarios.create(@dados_bancarios_params))

        post :create, params: @params
        expect(flash[:danger]).to include(
          "Codigo can't be blank",
          "Agencia can't be blank",
          "Conta corrente can't be blank"
        )
        expect(subject).to redirect_to ('/dashboard/dados_bancarios')
      end
    end

    describe '#edit' do
      it 'should render the views/dados_bancarios/edit.html.haml' do
        @dados_bancarios = FactoryBot.build(:dados_bancarios)
        @user = FactoryBot.build(:user)

        expect(get: '/dados_bancarios/1/edit').to route_to(
          controller: 'dados_bancarios',
          action: 'edit',
          id: "1"
        )
        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@user)
        allow(DadosBancarios).to receive(:find).and_return(@dados_bancarios)
        get :edit, params: {id: "1"}
      end

      it 'should call the Sessions Helper method that returns the User' do
        @user = FactoryBot.build(:user, id: 1, fk_banco: 1)
        @dados_bancarios = FactoryBot.build(:dados_bancarios, id: 1)

        expect_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@user)
        allow(DadosBancarios).to receive(:find).with(@user.fk_banco).and_return(@dados_bancarios)
        get :edit, params: {id: "1"}
      end

      it 'should call the model method that finds the Dados Bancarios of the user' do
        @user = FactoryBot.build(:user, id: 1, fk_banco: 1)
        @dados_bancarios = FactoryBot.build(:dados_bancarios, id: 1)

        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@user)
        expect(DadosBancarios).to receive(:find).with(@user.fk_banco).and_return(@dados_bancarios)
        get :edit, params: {id: "1"}
      end
    end

    describe '#update' do
      before :each do
        @info = {
          codigo: 'Banco Bradesco',
          agencia: '38043',
          conta_corrente: '491204'
        }

        @params = Hash.new
        @params[:dados_bancarios] = @info
        @params[:id] = "1"

        @db_dados_bancarios = FactoryBot.create(:dados_bancarios, id: 1)
      end

      it 'should call the model method that finds the user Dados Bancarios' do
        expect(DadosBancarios).to receive(:find).with(@params[:id]).and_return(@db_dados_bancarios)
        put :update, params: @params
      end

      it 'should call the instance method that updates the Dados Bancarios attributes' do
        ActionController::Parameters.permit_all_parameters = true
        @dados_bancarios_params = ActionController::Parameters.new(@params[:dados_bancarios])

        allow(DadosBancarios).to receive(:find).with(@params[:id]).and_return(@db_dados_bancarios)
        expect(@db_dados_bancarios).to receive(:update_attributes).with(@dados_bancarios_params)
          .and_return(@db_dados_bancarios.update_attributes(@dados_bancarios_params))
        put :update, params: @params
      end

      it 'should set de flash and redirect the user to the Dados Bancarios page' do
        allow(DadosBancarios).to receive(:find).with(@params[:id]).and_return(@db_dados_bancarios)
        put :update, params: @params
        expect(flash[:notice]).to eq('Dados atualizados com sucesso!')
        expect(subject).to redirect_to('/dashboard/dados_bancarios')
      end
    end

    describe '#update sad path' do
      before :each do
        @invalid_info = {
          codigo: '',
          agencia: '',
          conta_corrente: ''
        }

        @params = Hash.new
        @params[:dados_bancarios] = @invalid_info
        @params[:id] = "1"

        @db_dados_bancarios = FactoryBot.create(:dados_bancarios, id: 1)
      end

      it 'tries to update a Dados Bancarios with invalid information' do
        ActionController::Parameters.permit_all_parameters = true
        @dados_bancarios_params = ActionController::Parameters.new(@params[:dados_bancarios])

        allow(DadosBancarios).to receive(:find).with(@params[:id]).and_return(@db_dados_bancarios)
        expect(@db_dados_bancarios).to receive(:update_attributes).with(@dados_bancarios_params)
          .and_return(@db_dados_bancarios.update_attributes(@dados_bancarios_params))
        put :update, params: @params
        expect(flash[:danger]).to include(
          "Codigo can't be blank",
          "Agencia can't be blank",
          "Conta corrente can't be blank"
        )
        expect(subject).to redirect_to('/dashboard/dados_bancarios')
      end
    end

    describe '#destroy' do
      before :each do
        @params = {}
        @params[:id] = "1"

        @db_dados_bancarios = FactoryBot.create(:dados_bancarios, id: 1)
        @db_user = FactoryBot.build(:user, fk_banco: 1)
      end

      it 'calls the Sessions Helper method that returns the User' do
        expect_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@db_user)
        delete :destroy, params: @params
      end

      it 'calls the model method that finds the User\'s Dados Bancarios' do
        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@db_user)
        expect(DadosBancarios).to receive(:find).with(@params[:id])
          .and_return(@db_dados_bancarios)
        delete :destroy, params: @params
      end

      it 'calls the instance method that deletes the Dados Bancarios' do
        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@db_user)
        allow(DadosBancarios).to receive(:find).with(@params[:id]).and_return(@db_dados_bancarios)
        expect(@db_dados_bancarios).to receive(:delete).and_return(@db_dados_bancarios.delete)
        delete :destroy, params: @params
      end

      it 'calls the User\'s instance method that performs the update' do
        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@db_user)
        expect(@db_user).to receive(:update).with(fk_banco: nil).and_return(@db_user.update(fk_banco: nil))
        delete :destroy, params: @params
      end

      it 'should set the flash and redirect the user' do
        allow_any_instance_of(DadosBancariosController).to receive(:current_user)
          .and_return(@db_user)
        delete :destroy, params: @params
        expect(flash[:notice]).to eq('Dados bancários apagados com sucesso!')
        expect(subject).to redirect_to('/dashboard/dados_bancarios')
      end
    end
  end

  describe 'User Not Logged' do
    it 'should redirect the user if not logged in' do
      get :new
      expect(response).to redirect_to '/sessions/new'
      expect(flash[:notice]).to eq('Você precisa estar logado para acessar essa página')
    end
  end
end