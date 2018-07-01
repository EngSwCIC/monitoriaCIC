# frozen string literal: true

require 'rails_helper'

describe DashboardController do
  describe 'Logged User' do
    before :each do
      allow_any_instance_of(DashboardController).to receive(:user_logged).and_return(true)
    end

    describe '#index' do
      it 'should render the views/dashboard/dados_bancarios.html.haml' do
        get :dados_bancarios
        expect(response).to render_template(:dados_bancarios)
      end
    end

    describe '#edit_user' do
      it 'should render the views/dashboard/edit_user.html.haml as a User' do
        @user = FactoryBot.build(:user)
        allow_any_instance_of(DashboardController).to receive(:current_user).and_return(@user)
        get :edit_user
        expect(response).to render_template(:edit_user)
      end

      it 'should render the views/dashboard/edit_user.html.haml as a Professor' do
        @professor = FactoryBot.build(:professor)
        allow_any_instance_of(DashboardController).to receive(:current_user).and_return(@professor)
        get :edit_user
        expect(response).to render_template(:edit_user)
      end

      it 'should redirect the user to the Dashboard page if it is not a User nor a Professor' do
        get :edit_user
        expect(response).to redirect_to ('/dashboard')
      end
    end
  end

  describe 'Not Logged User' do
    it 'should redirect the user to the new sessions page if user not logged in' do
      get :index
      expect(response).to redirect_to ('/sessions/new')
      expect(flash[:notice]).to eq('Você precisa estar logado para acessar essa página')

      get :edit_user
      expect(response).to redirect_to('/sessions/new')
      expect(flash[:notice]).to eq('Você precisa estar logado para acessar essa página')
    end
  end
end