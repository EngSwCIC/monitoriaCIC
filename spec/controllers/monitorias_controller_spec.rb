# frozen string literal: true

require 'rails_helper'

describe MonitoriasController do
  describe "user logged" do 
    before :each do
      allow_any_instance_of(MonitoriasController).to receive(:logged_in).and_return(true)
    end
    describe "instance methods" do
      describe "#find_monitoria" do
        it "encontra a monitoria no banco" do
          @monitoria = FactoryBot.create(:monitoria, id: '1')
          @monitoria.save
          monitoria = Monitoria.find(1)
          expect(monitoria).to eq(@monitoria) 
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

      describe "#logged_in" do
        context "Happy Path" do 
          it "does not redirect to new_session_path" do
            allow_any_instance_of(MonitoriasController).to receive(:logged_in).and_return true
            expect(response).to_not redirect_to new_session_path
          end
        end

        context "Sad Path" do 
          it "redirects to new_session_path" do
            allow_any_instance_of(MonitoriasController).to receive(:logged_in).and_return false
            expect(response).to be_successful
          end
        end
      end

    end
    describe "URL methods" do
      describe 'GET #new' do
        it 'render new template' do
          get :new
          expect(response).to render_template(:new)
        end
      end

      describe 'GET #edit' do
        it 'render edit template' do
          monitoria = FactoryBot.create(:monitoria)
          params = {}
          params[:id] = 1
          get :edit, params: params
          expect(response).to render_template(:edit)
        end
      end

      describe 'GET #show' do
        it 'render show template' do
          get :show
          expect(response).to render_template(:show)
        end
      end

      describe 'POST #create' do
        describe 'happy path' do
          before :each do
            @info = {
              remuneracao: 'Voluntária',
              fk_matricula: '140080384',
              fk_cod_disciplina: '1',
              fk_turmas_id: '1',
              descricao_status: 'Nota: SS, IRA: 3',
              prioridade: '1',
              fk_status_monitoria_id: '1'
            }

            @monitoria = FactoryBot.create(:monitoria, id: 1)
            @params = {}
            @params[:monitoria] = @info
          end

          it '#monitoria_params' do
            expect_any_instance_of(MonitoriasController).to receive(:monitoria_params)
              .and_return @params[:monitoria]
            post :create, params: @params
          end

          it 'Cria monitoria no banco' do
            @monitoria = Monitoria.new(@params[:monitoria])
            post :create, params: @params
            expect(@monitoria.save).to be true
          end

          it 'redirects to dashboard_monitorias_path' do
            @monitoria = FactoryBot.build(:monitoria)

            allow_any_instance_of(MonitoriasController).to receive(:monitoria_params)
              .and_return(@params[:monitoria])
            allow(Monitoria).to receive(:create).and_return @monitoria

            post :create, params: @params
            expect(subject).to redirect_to('/dashboard/monitorias')
          end
        end

        describe 'sad path' do
          before :each do
            @invalid_info = {
              remuneracao: 'Voluntária',
              fk_matricula: '140080384',
              fk_cod_disciplina: '1',
              fk_turmas_id: '1',
              descricao_status: 'Nota: SS, IRA: 3',
              prioridade: '1',
              fk_status_monitoria_id: '1'
            }
            @aplicacao1 = Monitoria.new(@invalid_info)
            @aplicacao2 = Monitoria.new(@invalid_info)
            @aplicacao1.save
            @params = {}
            @params[:monitoria] = @invalid_info
          end

          it 'Tenta aplicar para monitor da mesma turma novamente' do
            post :create, params: @params
            expect(flash[:danger]).to include(
              "Ocorreu um erro ao cadastrar a monitoria. Nenhuma monitoria cadastrada."
            )
          end
        end
      end

      describe 'PUT #update' do
        describe 'happy path' do
          before :each do
            @db_monitoria = FactoryBot.create(:monitoria, id: '1')
            @info = {
              remuneracao: 'Voluntária',
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

          it 'encontra a monitoria no banco' do
            expect(Monitoria).to receive(:find).with(@params[:id]).and_return(@db_monitoria)
            put :update, params: @params
          end

          it '#monitoria_params' do
            allow(Monitoria).to receive(:find).and_return(@db_monitoria)
            expect_any_instance_of(MonitoriasController).to receive(:monitoria_params)
              .and_return(@params[:monitoria])
            put :update, params: @params
          end

          it 'atualiza a situaçao da monitoria' do
            expect(@db_monitoria.update(:fk_status_monitoria_id => '2')).to be true
          end

          it 'notificar e redirecionar usuario' do
            allow(Monitoria).to receive(:find).and_return(@db_monitoria)
            put :update, params: @params
            expect(flash[:notice]).to eq('Situaçao atualizada!')
            expect(subject).to redirect_to('/dashboard/monitorias')
          end
          it "coordenador altera situação da monitoria" do
            allow_any_instance_of(MonitoriasController).to receive(:is_admin).and_return(true)
            expect(@db_monitoria.update(open: false, fk_status_monitoria_id: '2')).to be true
          end
        end
        describe 'sad path' do
          before :each do
            @db_monitoria = FactoryBot.create(:monitoria, id: '1', open: true)
            @info = {
              remuneracao: 'Voluntária',
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

          it "coordenador não altera situação da monitoria" do
            allow_any_instance_of(MonitoriasController).to receive(:is_admin).and_return true
            allow(Monitoria).to receive(:find).and_return(@db_monitoria)
            put :update, params: @params
            expect(flash[:notice]).to eq('Período de inscrição ainda aberto!')
            expect(subject).to redirect_to('/dashboard/monitorias')
          end  
        end
      end

      describe 'DELETE #destroy' do
        before :each do
          @db_turma = FactoryBot.create(:monitoria, id: '1')
          @params = {}
          @params[:id] = '1'
        end

        it "deleta a monitoria do banco" do 
            @db_turma.save
            expect(@db_turma.destroy).to eq(@db_turma)
          end

        it 'notifica e redireciona o usuario' do
          delete :destroy, params: @params
          expect(flash[:notice]).to eq('Monitoria removida!')
          expect(subject).to redirect_to('/dashboard/monitorias')
        end
      end
    end
  end
  describe 'User Not Logged' do
    it 'should redirect the user if not logged in' do
      get :new
      expect(response).to redirect_to '/sessions/new'
      expect(flash[:notice]).to eq('Você precisa estar logado para acessar a pagina Monitoria')
    end
  end
  
  describe 'not admin' do
    allow_any_instance_of(MonitoriasController).to receive(:is_admin).and_return(true)
  end
end