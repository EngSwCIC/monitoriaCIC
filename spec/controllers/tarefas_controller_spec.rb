# frozen string literal: true

require 'rails_helper'
describe TarefasController do
    before :all do
        @monitoria = FactoryBot.create(:monitoria, id: '2')
    end

    
    describe "URL methods" do
        describe 'GET #index' do
            it 'should render tarefas' do 
                params = {}
                params[:monitoria_id] = '2'
                get :index, params: params
                expect(response).to render_template(:index)
            end
        end

        describe 'GET #new' do
            it 'render new template' do
                get :new
                expect(response).to render_template(:new)
            end
        end

        describe 'GET #edit' do
            it 'render edit template' do
                tarefa = FactoryBot.create(:tarefa, id: 1, monitoria_id: '2')
                params = {}
                params[:id] = 1
                get :edit, params: params
                expect(response).to render_template(:edit)
            end
        end

        describe 'GET #show' do
            it 'render show template' do
                tarefa = FactoryBot.create(:tarefa, id: 1, monitoria_id: '2')
                params = {}
                params[:id] = 1
                get :show, params: params
                expect(response).to render_template(:show)
            end
        end

        describe 'POST #create' do
            describe 'happy path' do
                before :each do
                    @info = {
                        titulo: 'Corrigir',
                        descricao: 'Corrgir diversos trabalhos maneiros',
                        nota: 4,
                        feito: false,
                        monitoria_id: '2'
                    }

                    @tarefa = FactoryBot.create(:tarefa, id: 1, monitoria_id: '2')
                    @params = {}
                    @params[:tarefa] = @info
                end
                

                it 'Cria tarefa no banco' do
                    @tarefa = Tarefa.new(@params[:tarefa])
                    post :create, params: @params
                    expect(@tarefa.save).to be true
                end

                it 'redirects to dashboard_monitorias_path' do
                    @tarefa = FactoryBot.build(:tarefa)
                    allow_any_instance_of(TarefasController).to receive(:tarefa_params)
                        .and_return(@params[:tarefa])
                    allow(Tarefa).to receive(:create).and_return @tarefa

                    post :create, params: @params
                    expect(subject).to redirect_to('/dashboard/monitorias')
                end
            end
            describe 'sad path' do
                before :each do
                  @invalid_info = {
                    titulo: nil,
                    descricao: nil,
                    nota: 4,
                    feito: false,
                    monitoria_id: '3'
                  }
                  @tarefa = Tarefa.new(@invalid_info)
                  @tarefa.save
                  @params = {}
                  @params[:tarefa] = @invalid_info
                end
        
                it 'Tenta criar uma tarefa com parametros inválidos' do
                  post :create, params: @params
                  expect(flash[:danger]).to include(
                    "Ocorreu um erro ao atribuir a tarefa."
                  )
                end
            end
        end

        describe 'PUT #update' do
            describe 'happy path' do
                before :each do
                    @tarefa = FactoryBot.create(:tarefa, id: '1')
                    @info = {
                        titulo: 'Corrigir',
                        descricao: 'Corrgir diversos trabalhos maneiros',
                        nota: 4,
                        feito: false,
                        monitoria_id: '2'
                    }

                    @params = {}
                    @params[:tarefa] = @info
                    @params[:id] = '1'
                end

                it 'encontra a tarefa no banco' do
                    expect(Tarefa).to receive(:find).with(@params[:id]).and_return(@tarefa)
                    put :update, params: @params
                end

                it '#tarefa_params' do
                    allow(Tarefa).to receive(:find).and_return(@tarefa)
                    expect_any_instance_of(TarefasController).to receive(:tarefa_params)
                        .and_return(@params[:tarefa])
                    put :update, params: @params
                end

                it 'atualiza a situaçao da tarefa' do
                    expect(@tarefa.update(:nota => '10')).to be true
                end

                it 'notificar e redirecionar usuario' do
                    allow(Tarefa).to receive(:find).and_return(@tarefa)
                    put :update, params: @params
                    expect(flash[:notice]).to eq('Tarefa atualizada!')
                    expect(subject).to redirect_to('/dashboard/monitorias')
                end
            end
            describe 'sad path' do
                before :each do
                    @tarefaValida = FactoryBot.create(:tarefa, id: '1')
                    @invalid_info = {
                        titulo: nil,
                        descricao: nil,
                        nota: 4,
                        feito: false,
                        monitoria_id: '3'
                    }
                    @tarefa = Tarefa.new(@invalid_info)
                    @tarefa.save
                    @params = {}
                    @params[:tarefa] = @invalid_info
                    @params[:id] = '1'
                end
        
                it 'Tenta atualizar uma tarefa com parametros inválidos' do
                  put :update, params: @params
                  expect(flash[:danger]).to include(
                    "Ocorreu um erro ao atualizar a tarefa."
                  )
                end
            end
        end

        describe 'DELETE #destroy' do
            before :each do
                @tarefa = FactoryBot.create(:tarefa, id: '1', monitoria_id: '2')
                @params = {}
                @params[:id] = '1'
            end

            it "deleta a tarefa do banco" do 
                @tarefa.save
                expect(@tarefa.destroy).to eq(@tarefa)
            end

            it 'notifica e redireciona o usuario' do
                delete :destroy, params: @params
                expect(flash[:notice]).to eq('Tarefa removida!')
                expect(subject).to redirect_to('/dashboard/monitorias')
            end
        end
    end
end