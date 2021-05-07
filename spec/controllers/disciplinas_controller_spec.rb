require 'rails_helper'

describe DisciplinasController do
	before :each do
		allow_any_instance_of(DisciplinasController).to receive(:logged_in).and_return true
		allow_any_instance_of(DisciplinasController).to receive(:is_admin).and_return true
	end

	describe "instance methods" do
		describe "#find_disciplina" do
			it "encontra a disciplina no banco" do
        @disciplina = FactoryBot.create(:disciplina, id: '1')
				@disciplina.save
        disciplina = Disciplina.find(1)
				expect(disciplina).to eq(@disciplina) 
			end
		end

		describe "Tem um usuario logado" do
			context "Happy Path" do 
				it "does not redirect to new_session_path" do
					allow_any_instance_of(DisciplinasController).to receive(:logged_in).and_return true
					expect(response).to_not redirect_to new_session_path
				end
			end

			context "Sad Path" do 
				it "redirects to new_session_path" do
					allow_any_instance_of(DisciplinasController).to receive(:logged_in).and_return false
					expect(response).to be_successful
				end
			end
		end

		describe "Usuario tem acesso ao CRUD" do
			context "Happy Path" do 
				it "does not redirect to disciplinas_path" do
					allow_any_instance_of(DisciplinasController).to receive(:is_admin).and_return true
					expect(response).to_not redirect_to disciplinas_path
				end
			end

			context "Sad Path" do 
				it "redirects to disciplinas_path" do
					allow_any_instance_of(DisciplinasController).to receive(:is_admin).and_return false
					expect(response).to be_successful
				end
			end
		end
	end

	describe "URL methods" do
		describe "GET #new" do
			it "renders the :new view" do
				get :new
    			expect(response).to render_template :new
			end
		end

		describe "POST #create" do
			context "Happy Path" do
        before :each do
          @info = {
            nome: 'Engenharia de Software',
            fk_tipo_disciplina_id: '1',
            c_prat: '4',
            c_teor: '2',
            c_est: '4',
            c_ext: '0',
            monitoria: true
          }

          @disciplina = FactoryBot.create(:disciplina, id: 1)
          @params = {}
          @params[:disciplina] = @info
        end

        it '#disciplina_params' do
          expect_any_instance_of(DisciplinasController).to receive(:disciplina_params)
            .and_return @params[:disciplina]
          post :create, params: @params
        end

				it "saves the new disciplina in the database" do 
					@disciplina = Disciplina.new(@params[:disciplina])
          post :create, params: @params
          expect(@disciplina.save).to be true
				end

	      it "redirects to dashboard_disciplinas_path" do 
	      	@disciplina = FactoryBot.build(:disciplina)

          allow_any_instance_of(DisciplinasController).to receive(:disciplina_params)
            .and_return(@params[:disciplina])
          allow(Disciplina).to receive(:create).and_return @disciplina

          post :create, params: @params
          expect(subject).to redirect_to dashboard_disciplinas_path
	      end
			end

			context "Sad Path" do
        before :each do
          @invalid_info = {
            nome: 'Engenharia de Software',
            fk_tipo_disciplina_id: '1',
            c_prat: '',
            c_teor: '',
            c_est: '',
            c_ext: '',
            monitoria: true
          }

          @cadastro = Disciplina.new(@invalid_info)
          @cadastro.save
          @params = {}
          @params[:disciplina] = @invalid_info
        end

				it "does not save the new disciplina in the database" do 
					post :create, params: @params
          expect(flash[:danger]).to include(
            "Ocorreu um erro ao cadastrar a disciplina. Nenhuma disciplina cadastrada."
          )
          expect(response).to render_template(:new)
				end
			end
		end

		describe "GET #edit" do
			it "renders the :edit view" do
				disciplina = FactoryBot.create(:disciplina)
        params = {}
        params[:id] = 1
        get :edit, params: params
        expect(response).to render_template(:edit)
    	end
		end

		describe "PUT #update" do
			context "Happy Path" do
        before :each do
          @db_disciplina = FactoryBot.create(:disciplina, id: '1')
          @info = {
            nome: 'Engenharia de Software',
            fk_tipo_disciplina_id: '1',
            c_prat: '2',
            c_teor: '4',
            c_est: '4',
            c_ext: '0',
            monitoria: false
          }

          @params = {}
          @params[:disciplina] = @info
          @params[:id] = '1'
        end

        it 'finds the disciplina in the database' do
          expect(Disciplina).to receive(:find).with(@params[:id]).and_return(@db_disciplina)
          put :update, params: @params
        end

				it '#disciplina_params' do
          allow(Disciplina).to receive(:find).and_return(@db_disciplina)
          expect_any_instance_of(DisciplinasController).to receive(:disciplina_params)
            .and_return(@params[:disciplina])
          put :update, params: @params
        end

        it 'updates the disciplina in the databse' do
          allow(Disciplina).to receive(:find).and_return(@db_disciplina)
          put :update, params: @params
          expect(flash[:notice]).to eq('Disciplina atualizada!')
          expect(subject).to redirect_to dashboard_disciplinas_path
        end
			end

			context "Sad Path" do
        before :each do
          @db_disciplina = FactoryBot.create(:disciplina, id: '1')
          @invalid_info = {
            nome: '',
            fk_tipo_disciplina_id: '',
            c_prat: '',
            c_teor: '',
            c_est: '',
            c_ext: ''
          }

          @params = {}
          @params[:disciplina] = @invalid_info
          @params[:id] = '1'
        end

				it "does not update the disciplina in the database" do
          allow(Disciplina).to receive(:find).and_return(@db_disciplina)
          put :update, params: @params
          expect(flash[:danger]).to eq('Ocorreu um erro ao atualizar a disciplina.')
          expect(subject).to render_template(:edit)
				end
			end
		end

		describe "DELETE #destroy" do
      before :each do
        @db_disciplina = FactoryBot.create(:disciplina, cod_disciplina: '10')
        @params = {}
        @params[:id] = '1'
      end

			it "deletes the disciplina" do 
				@db_disciplina.save
				expect(@db_disciplina.destroy).to eq(@db_disciplina)
			end

			it "redirects to the dashboard_disciplinas_path" do
				delete :destroy, params: @params
        expect(flash[:notice]).to eq('Disciplina removida!')
        expect(subject).to redirect_to dashboard_disciplinas_path
			end
		end
	end

end
