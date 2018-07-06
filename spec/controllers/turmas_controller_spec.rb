# frozen string literal: true

require 'rails_helper'

describe TurmasController do
  describe '#new' do
    it 'should render the views/turmas/new.html.haml' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    it 'should render the views/turmas/edit.html.haml' do
      turma = FactoryBot.create(:turma)
      params = {}
      params[:id] = 1
      get :edit, params: params
      expect(response).to render_template(:edit)
    end
  end

  describe '#create' do
    describe 'happy path' do
      before :each do
        @info = {
          turma: 'A',
          professor: 'Genaina Nunes Rodrigues',
          fk_cod_disciplina: "1",
          qnt_bolsas: "4",
          fk_vagas_id: "1"
        }

        @disciplina = FactoryBot.create(:disciplina, cod_disciplina: 1)
        @params = {}
        @params[:turma] = @info
      end

      it 'should call the controller method that filters the form input' do
        expect_any_instance_of(TurmasController).to receive(:turma_params)
          .and_return @params[:turma]
        post :create, params: @params
      end

      it 'should call the model method that creates the Turma' do
        ActionController::Parameters.permit_all_parameters = true
        @turma = ActionController::Parameters.new(@params[:turma])

        expect(Turma).to receive(:create).with(@turma)
          .and_return(Turma.create(@turma))
        post :create, params: @params
      end

      it 'should set the flash and redirect the user' do
        @turma = FactoryBot.build(:turma)

        allow_any_instance_of(TurmasController).to receive(:turma_params)
          .and_return(@params[:turma])
        allow(Turma).to receive(:create).and_return @turma

        post :create, params: @params
        expect(flash[:notice]).to eq('Turma cadastrada com sucesso!')
        expect(subject).to redirect_to('/dashboard/turmas')
      end
    end

    describe 'sad path' do
      before :each do
        @invalid_info = {
          turma: 'A',
          professor: 'Genaina Nunes Rodrigues',
          fk_cod_disciplina: '1',
          qnt_bolsas: '1',
          fk_vagas_id: '1'
        }

        @db_disciplina = FactoryBot.create(:disciplina, cod_disciplina: '1')
        @db_turma = FactoryBot.create(:turma, turma: 'A', fk_cod_disciplina: '1')
        @params = {}
        @params[:turma] = @invalid_info
      end

      it 'tries to create a Turma that is not unique for a given Disciplina' do
        post :create, params: @params
        expect(flash[:danger]).to include(
          "Turma A não é a única para a disciplina Engenharia de Software"
        )
      end
    end
  end

  describe '#update' do
    describe 'happy path' do
      before :each do
        @disciplina = FactoryBot.create(:disciplina, cod_disciplina: '1')
        @db_turma = FactoryBot.create(:turma, id: '1')
        @info = {
          turma: 'B',
          professor: 'Genaina Nunes Rodrigues',
          fk_cod_disciplina: '1',
          qnt_bolsas: '1',
          fk_vagas_id: '1'
        }

        @params = {}
        @params[:turma] = @info
        @params[:id] = '1'
      end

      it 'should call the model method that finds the Turma to be edited' do
        expect(Turma).to receive(:find).with(@params[:id]).and_return(@db_turma)
        put :update, params: @params
      end

      it 'should should call the controller method that filters the form input' do
        allow(Turma).to receive(:find).and_return(@db_turma)
        expect_any_instance_of(TurmasController).to receive(:turma_params)
          .and_return(@params[:turma])
        put :update, params: @params
      end

      it 'should call the instance method that performs the update' do
        ActionController::Parameters.permit_all_parameters = true
        @turma = ActionController::Parameters.new(@params[:turma])

        allow(Turma).to receive(:find).and_return(@db_turma)
        expect(@db_turma).to receive(:update_attributes).with(@turma)
          .and_return(@db_turma.update_attributes(@turma))
        put :update, params: @params
      end

      it 'should set the flash and redirect the user' do
        allow(Turma).to receive(:find).and_return(@db_turma)
        put :update, params: @params
        expect(flash[:notice]).to eq('Turma atualizada com sucesso!')
      end
    end

    describe 'sad path' do
      before :each do
        @db_turma1 = FactoryBot.create(:turma, id: '1', fk_cod_disciplina: '1', turma: 'A')
        @db_turma2 = FactoryBot.create(:turma, id: '2', fk_cod_disciplina: '1', turma: 'B')
        @disciplina = FactoryBot.create(:disciplina, cod_disciplina: '1')

        @invalid_info = {
          turma: 'B',
          professor: 'Genaina Nunes Rodrigues',
          fk_cod_disciplina: '1',
          qnt_bolsas: '1',
          fk_vagas_id: '1'
        }
        @params = {}
        @params[:turma] = @invalid_info
        @params[:id] = '1'
      end

      it 'tries to update a Turma that is not unique for a given Disciplina' do
        put :update, params: @params
        expect(flash[:danger]).to include(
          "Turma B não é a única para a disciplina Engenharia de Software"
        )
      end
    end
  end

  describe '#destroy' do
    before :each do
      @db_turma = FactoryBot.create(:turma, id: '1')
      @params = {}
      @params[:id] = '1'
    end

    it 'should delete a given Turma' do
      expect(Turma).to receive(:find).with(@params[:id])
        .and_return(Turma.find(@params[:id]))
      delete :destroy, params: @params
      expect(flash[:notice]).to eq('Turma apagada com sucesso!')
      expect(subject).to redirect_to('/dashboard/turmas')
    end
  end

  describe '#get_turmas' do
    before :each do
      @professor1 = FactoryBot.create(:professor, id: '10', name: 'Marcus Lamar',
                                      username: 'mlamar', email: 'lamar@unb.br')
      @professor2 = FactoryBot.create(:professor, id: '12', name: 'Maristela Holanda',
                                      username: 'mholanda', email: 'mholanda@unb.br')
      @disciplina1 = FactoryBot.create(:disciplina, cod_disciplina: '1')
      @disciplina2 = FactoryBot.create(:disciplina, cod_disciplina: '2')
      @turma1 = FactoryBot.create(:turma, id: '1', fk_cod_disciplina: '1', turma: 'A', professor: 'Marcus Lamar')
      @turma2 = FactoryBot.create(:turma, id: '2', fk_cod_disciplina: '1', turma: 'B', professor: 'Marcus Lamar')
      @turma3 = FactoryBot.create(:turma, id: '3', fk_cod_disciplina: '2', turma: 'A', professor: 'Maristela Holanda')
    end

    it 'should return an array of Turmas' do
      expect(TurmasController.get_turmas(@professor1)).to eq([@turma1, @turma2])
    end
  end
end