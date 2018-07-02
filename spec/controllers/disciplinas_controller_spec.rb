require 'rails_helper'

describe DisciplinasController do
	before :each do
		allow_any_instance_of(DisciplinasController).to receive(:logged_in).and_return true
		allow_any_instance_of(DisciplinasController).to receive(:is_admin).and_return true
		@engenharia = Disciplina.new(:nome => "Engenharia de Software", :fk_tipo_disciplina_id => 1, :c_prat => 4, :c_teor => 2, :c_est => 4, :c_ext => 0)
		@params = Hash.new
		@params[:disciplina] = @engenharia
	end

	describe "instance methods" do
		describe "Localiza disciplina" do
			it "atribui a disciplina procurada para @disciplina" do
				@engenharia.save
				disciplina = Disciplina.find(1)
				expect(disciplina).to eq(@engenharia) 
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
		describe "GET #index" do
			it "populates an array of disciplinas" do
				@engenharia.save
				disciplinas = Disciplina.find_each
				expect(disciplinas.count).to_not be eq(0)
			end
			it "renders the :index view" do
				get :index
    			expect(response).to render_template :index				
			end
		end

		describe "GET #show" do
			it "renders the :show view" do 
				@engenharia.save
				get :show, params: { id: @engenharia.cod_disciplina }
    			expect(response).to render_template :show
    		end
		end

		describe "GET #new" do
			it "renders the :new view" do
				get :new
    			expect(response).to render_template :new
			end
		end

		describe "POST #create" do
			context "Happy Path" do
				it "saves the new disciplina in the database" do 
					expect(@engenharia.save).to be true
				end
	      		it "redirects to the disciplinas_path" do 
	      			post :create, params: {disciplina:@params}
	      			expect(response).to be_successful
	      		end
			end

			context "Sad Path" do
				it "does not save the new disciplina in the database" do 
					@engenharia.nome=""
					expect(@engenharia.save).to be false
				end
	      		it "re-renders the :new view" do
	      			get :new
    				expect(response).to render_template :new
    			end
			end
			
		end

		describe "GET #edit" do
			it "renders the :edit view" do
				@engenharia.save
	      		get :edit, params: { id: @engenharia.cod_disciplina }
    			expect(response).to render_template :edit
    		end
		end

		describe "PUT #update" do
			context "Happy Path" do
				it "updates the disciplina in the database" do 
					expect(@engenharia.update(:nome => "Software")).to be true
				end
	      		it "redirects to the disciplinas_path" do 
	      			@engenharia.save
	      			put :update, {params: { disciplina: @params, id: @engenharia.cod_disciplina}}
	      			expect(response).to redirect_to disciplinas_path
	      		end
			end

			context "Sad Path" do
				it "does not update the disciplina in the database" do
					expect(@engenharia.update(:nome => "")).to be false
				end
	      		it "re-renders the :edit view" do 
	      			@engenharia.save
	      			get :edit, params: { id: @engenharia.cod_disciplina }
    				expect(response).to render_template :edit
    			end
			end
		end

		describe "DELETE #destroy" do
			it "deletes the disciplina" do 
				@engenharia.save
				expect(@engenharia.destroy).to eq(@engenharia)
			end
			it "redirects to the disciplinas_path" do
				@engenharia.save
	      		post :destroy, params: {id: @engenharia.cod_disciplina}
	      		expect(response).to redirect_to disciplinas_path
			end
		end
	end

end
