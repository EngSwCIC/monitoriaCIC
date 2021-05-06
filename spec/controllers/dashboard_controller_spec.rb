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

    describe '#turmas' do
      it 'should render the views/dashboard/turmas.html.haml' do
        get :turmas
        expect(response).to render_template(:turmas)
      end
    end

    describe '#disciplinas' do
      it 'should return an array with all the Disciplinas' do
        expect(Disciplina).to receive(:find_each).and_return(Disciplina.find_each)
        get :disciplinas
        expect(response).to render_template(:disciplinas)
      end
    end

    describe '#monitorias' do
      before :each do
        allow_any_instance_of(DashboardController).to receive(:current_user)
                                                          .and_return(@user)

        @monitoria1 = FactoryBot.create(:monitoria, fk_matricula: '140080384')
        @monitoria2 = FactoryBot.create(:monitoria, id: '2', fk_matricula: '140080385')
        @all_monitorias = Monitoria.find_each
      end
      it 'should render the views/dashboard/monitorias.html.haml' do
        get :monitorias
        expect(response).to render_template(:monitorias)
      end

      it 'should return an array with all the Monitorias of a given User' do
        expect(Monitoria).to receive(:find_each).and_return(@all_monitorias)
        get :monitorias
      end
    end

    describe '#historico' do
      before :each do
        allow_any_instance_of(DashboardController).to receive(:current_user)
                                                          .and_return(@user)

        @monitoria1 = FactoryBot.create(:monitoria, fk_matricula: '140080384')
        @monitoria2 = FactoryBot.create(:monitoria, id: '2', fk_matricula: '140080385')
        @monitoria3 = FactoryBot.create(:monitoria, id: '3', fk_status_monitoria_id: '4', fk_matricula: '140080386')
        @all_monitorias = Monitoria.find_each
      end
      it 'should render the views/dashboard/historico.html.haml' do
        get :historico
        expect(response).to render_template(:historico)
      end

      it 'should return an array with all the Monitorias of a given User where fk_status_monitoria_id equal to 4' do
        expect(Monitoria).to receive(:find_each).and_return(@mostrar)
        get :historico
      end
    end

    describe '#atendimentos' do
      it 'should render the views/dashboard/atendimentos.html.haml as a User' do
        get :atendimentos
        expect(response).to render_template(:atendimentos)
      end

      # deve mostrar apenas os atendimentos do usuario logado
      #it 'should render only the atendimentos of logged User' do
        
      #end
    end

    describe '#apagar_alunos' do
      it 'should call the model method that finds all the Users in order of :matricula' do
        expect(User).to receive(:order).with(:matricula).and_return(User.order(:matricula))
        get :apagar_alunos
      end

      it 'should render the views/dashboard/apagar_alunos' do
        get :apagar_alunos
        expect(response).to render_template(:apagar_alunos)
      end
    end

    describe '#deletar_aluno' do
      before :each do
        @user = FactoryBot.build(:user, fk_banco: 10)
        @dados_bancarios = FactoryBot.create(:dados_bancarios, id: 10)
        @monitoria = FactoryBot.create(:monitoria, id: '11', fk_matricula: '140080279')
        @params = {}
        @params[:user] = {matricula: '140080279'}
      end

      describe 'happy path' do
        it 'should call the model method that finds a User by its :matricula' do
          expect(User).to receive(:find_by_matricula).with(@params[:user][:matricula])
                              .and_return(@user)
          post :deletar_aluno, params: @params
        end

        it 'should call the DadosBancarios model method that finds the Dados Bancarios of a given User' do
          allow(User).to receive(:find_by_matricula).with(@params[:user][:matricula])
                             .and_return(@user)
          expect(DadosBancarios).to receive(:where).with(id: @user.fk_banco)
                                        .and_return(@dados_bancarios)
          allow(DadosBancarios).to receive(:delete).with(@dados_bancarios)
          post :deletar_aluno, params: @params
        end

        it 'should call the DadosBancarios model method that deletes the Dados Bancarios of a given user' do
          allow(User).to receive(:find_by_matricula).with(@params[:user][:matricula])
                             .and_return(@user)
          allow(DadosBancarios).to receive(:where).with(id: @user.fk_banco)
                                       .and_return(@dados_bancarios)
          expect(DadosBancarios).to receive(:delete).with(@dados_bancarios)
          post :deletar_aluno, params: @params
        end

        it 'should call the Monitoria model method that finds the all the Monitorias of a given User' do
          allow(User).to receive(:find_by_matricula).with(@params[:user][:matricula])
                             .and_return(@user)
          expect(Monitoria).to receive(:where).with(fk_matricula: @user.matricula)
                                   .and_return(@monitoria)
          allow(Monitoria).to receive(:delete).with(@monitoria)
          post :deletar_aluno, params: @params
        end

        it 'should call the Monitoria model method that deletes the User' do
          allow(User).to receive(:find_by_matricula).with(@params[:user][:matricula])
                             .and_return(@user)
          expect(User).to receive(:delete).with(@user.id)
          post :deletar_aluno, params: @params
        end

        it 'should set the flash and redirect the user' do
          allow(User).to receive(:find_by_matricula).with(@params[:user][:matricula])
                             .and_return(@user)
          post :deletar_aluno, params: @params
          expect(flash[:notice]).to eq('Aluno apagado com sucesso!')
          expect(subject).to redirect_to('/dashboard/apagar_alunos')
        end
      end

      describe 'sad path' do
        it 'tries to delete a User without informing a :matricula' do
          @params[:user][:matricula] = ''
          expect(User).to receive(:find_by_matricula).with(nil)
                              .and_return(nil)
          post :deletar_aluno, params: @params
          expect(flash[:danger]).to eq('Digite uma matrícula para deletar algum aluno.')
        end

        it "tries to delete a User that doesn't exist" do
          @params[:user][:matricula] = '140082078'
          expect(User).to receive(:find_by_matricula).with(@params[:user][:matricula])
                              .and_return(nil)
          post :deletar_aluno, params: @params
          expect(flash[:danger]).to eq('Aluno de matrícula 140082078 não existe.')
        end
      end
    end

    describe '#importar_disciplinas' do
      it 'should call the model method that get and returns all Disciplinas' do
        expect(Disciplina).to receive(:all).and_return(Disciplina.all)
        get :importar_disciplinas
        expect(response).to render_template(:importar_disciplinas)
      end
    end


    describe '#raspar_disciplinas' do
      it 'should call the method raspar_matriculaweb_disciplinas that handles the web scraping and render importar_disciplinas page' do
        get :raspar_disciplinas
        expect(response).to redirect_to('/dashboard/importar_disciplinas')

        tradutores = Disciplina.find_by_cod_disciplina(116459)
        expect(tradutores.nome).to match(/Tradutores/)

        engsoft = Disciplina.find_by_cod_disciplina(116441)
        expect(engsoft.nome).to match(/Engenharia De Software/)
        expect(engsoft.c_teor).to eq(4)
      end
    end

    
    describe '#importar_professores' do
      it 'should call the model method that get and returns all Professors' do
        expect(Professor).to receive(:all).and_return(Professor.all)
        get :importar_professores
        expect(response).to render_template(:importar_professores)
      end
    end

    describe '#scrape_professores' do
      it 'should call the method web_scraper that handles the web scraping and render importar_professores page' do
        get :scrape_professores
        expect(response).to redirect_to('/dashboard/importar_professores')

        alba = Professor.find_by_email('alves@unb.br')
        expect(alba.name).to match(/Alba Cristina Magalhaes Alves de Melo/)

        rezende = Professor.find_by_email('prezende@unb.br')
        expect(rezende.name).to match(/Pedro Antonio Dourado Rezende/)

        vander = Professor.find_by_email('valves@unb.br')
        expect(vander.name).to match(/Vander Ramos Alves /)
      end
    end

    describe '#alocar_bolsa' do
      describe 'Alunos aceitos e sobram bolsas em algumas turmas' do
        before :each do
          @user1 = FactoryBot.create(:user, id: 1, matricula: "180103016", cpf: "06745907160", rg: "3235843", email: "profjoao@gmail.com")
          @user2 = FactoryBot.create(:user, id: 2, matricula: "159899212", cpf: "05716083102", rg: "3234243", email: "aluno2@gmail.com")
          @user3 = FactoryBot.create(:user, id: 3, matricula: "134423123", cpf: "06459861196", rg: "3542681", email: "aluno3@gmail.com")
          @user4 = FactoryBot.create(:user, id: 4, matricula: "123392837", cpf: "05400484107", rg: "3469171", email: "aluno4@gmail.com")
          
          @monitoria1 = FactoryBot.create(:monitoria, fk_status_monitoria_id: 1, fk_turmas_id: 1, remuneracao: 'Remunerado',
                                          fk_matricula: "180103016")
    
          @monitoria2 = FactoryBot.create(:monitoria, id: 2, fk_status_monitoria_id: 1, fk_turmas_id: 2, remuneracao: 'Remunerado',
                                          fk_matricula: "159899212")
    
          @monitoria3 = FactoryBot.create(:monitoria, id: 3, fk_status_monitoria_id: 1, fk_turmas_id: 1, remuneracao: 'Remunerado',
                                          fk_matricula: "134423123")
    
          @monitoria4 = FactoryBot.create(:monitoria, id: 4, fk_status_monitoria_id: 1, fk_turmas_id: 2, remuneracao: 'Remunerado',
                                          fk_matricula: "123392837")
    
          @turma1 = FactoryBot.create(:turma, id:1, qnt_bolsas: 4, turma: 'C')
          @turma2 = FactoryBot.create(:turma, id:2, qnt_bolsas: 2, turma: 'B')
    
        end
    
        it 'Todos os pedidos de monitoria sao aceitos, pois existe bolsas suficiente para todos os alunos' do
          get :alocar_bolsa
          monitorias = Monitoria.where(remuneracao: "Remunerado")
          monitorias.each_with_index do |monitoria|
            expect(monitoria.fk_status_monitoria_id).to eq(3)
          end
        end
        
        it 'Numero de bolsas que sobraram nas turmas depois da alocacao' do
          get :alocar_bolsa
          @turmas = Turma.all_turmas
          array = Array.new(@turmas.size)
          @turmas.each_with_index do |a, i|
            array[i] = a.qnt_bolsas
          end
          expect(array[0]).to eq(2)
          expect(array[1]).to eq(0)
        end
      end

      describe 'Aluno recusado por falta de vaga' do 
        before :each do
          @user1 = FactoryBot.create(:user, id: 1, matricula: "180103016", cpf: "06745907160", rg: "3235843", email: "profjoao@gmail.com")
          @monitoria1 = FactoryBot.create(:monitoria, fk_status_monitoria_id: 1, fk_turmas_id: 1, remuneracao: 'Remunerado', fk_matricula: "111111111")
          @turma1 = FactoryBot.create(:turma, id:1, qnt_bolsas: 0, turma: 'C')
        end
        
        it 'Aluno recusado por não ter vaga na turma' do
          get :alocar_bolsa
          monitorias = Monitoria.where(remuneracao: "Remunerado")
          monitorias.each_with_index do |monitoria|
            expect(monitoria.fk_status_monitoria_id).to eq(2)
          end
        end
      end

      describe 'Aluno recusado por falta de vaga' do 
        before :each do
          @user1 = FactoryBot.create(:user, id: 1, matricula: "180103016", cpf: "06745907160", rg: "3235843", email: "profjoao@gmail.com")
          @user2 = FactoryBot.create(:user, id: 2, matricula: "159899212", cpf: "05716083102", rg: "3343143", email: "aluno2@gmail.com")
          @monitoria1 = FactoryBot.create(:monitoria, fk_status_monitoria_id: 1, fk_turmas_id: 1, remuneracao: 'Remunerado', fk_matricula: "180103016")
          @monitoria2 = FactoryBot.create(:monitoria, id:2, fk_status_monitoria_id: 1, fk_turmas_id: 1, remuneracao: 'Remunerado', fk_matricula: "159899212")
          @turma1 = FactoryBot.create(:turma, id:1, qnt_bolsas: 2, turma: 'A')
        end
        
        it 'Alunos aceitos' do
          get :alocar_bolsa
          monitorias = Monitoria.where(remuneracao: "Remunerado")
          monitorias.each_with_index do |monitoria|
            expect(monitoria.fk_status_monitoria_id).to eq(3)
          end
        end

        it 'Numero de bolsas que sobraram nas turmas depois da alocacao' do
          get :alocar_bolsa
          turma = Turma.find_by_id(@turma1.id)
          expect(turma.qnt_bolsas).to eq(0)
        end

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
