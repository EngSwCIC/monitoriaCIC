# frozen_string_literal: true

require 'rails_helper'

describe ProfessorsController do
  describe '#new' do
    it 'should render the views/professors/new.html.haml' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    describe 'happy path' do
      before :each do
        @info = {
          name: 'Genaina Nunes Rodrigues',
          username: 'grodrigues',
          email: 'genaina@unb.br',
          role: '4',
          password: '110492',
          password_confirmation: '110492'
        }

        @params = Hash.new
        @params[:professor] = @info
      end

      it 'calls the controller method that filters the form input' do
        expect_any_instance_of(ProfessorsController).to receive(:professor_params)
          .and_return @params[:professor]
        post :create, params: @params
      end

      it 'calls the model method that creates the Professor' do
        ActionController::Parameters.permit_all_parameters = true
        @professor = ActionController::Parameters.new(@params[:professor])

        expect(Professor).to receive(:create).with(@professor)
                                             .and_return(Professor.create(@professor))
        post :create, params: @params
      end

      it 'calls the session helper that logs the registered Professor' do
        @professor = FactoryBot.build(:professor)
        allow_any_instance_of(ProfessorsController).to receive(:professor_params)
          .and_return @params[:professor]
        allow(Professor).to receive(:create).with(@params[:professor])
                                            .and_return(@professor)
        expect_any_instance_of(ProfessorsController).to receive(:log_in).and_return(session[:user_id])
        post :create, params: @params
      end

      it 'redirects the registered Professor to the dashboard' do
        @new_professor = FactoryBot.build(:professor)
        ActionController::Parameters.permit_all_parameters = true
        @professor = ActionController::Parameters.new(@params[:professor])

        allow(Professor).to receive(:create).with(@professor)
                                            .and_return(@new_professor)
        post :create, params: @params
        expect(flash[:notice]).to eq('Registro realizado com sucesso!')
        redirect_to dashboard_path
        expect(subject).to redirect_to ('/dashboard')
      end
    end

    describe 'sad paths' do
      fixtures 'professor'

      before :each do
        @params = Hash.new

        @not_unique_info = {
          name: 'Genaina Nunes Rodrigues',
          username: 'grodrigues',
          email: 'genaina@unb.br',
          role: '4',
          password: '110492',
          password_confirmation: '110492'
        }

        @invalid_info = {
          name: '',
          username: '',
          email: '',
          role: '1',
          password: '',
          password_confirmation: ''
        }
      end

      it 'tries to create a Professor that is not unique' do
        @params[:professor] = @not_unique_info
        post :create, params: @params
        expect(flash[:danger]).to include(
          'Username has already been taken',
          'Email has already been taken'
        )
      end

      it 'tires to create a Professor with invalid information' do
        @params[:professor] = @invalid_info
        post :create, params: @params
        expect(flash[:danger]).to include(
          "Password can't be blank",
          "Password must be between 6 and 12 characters",
          "Name can't be blank",
          "Name is too short (minimum is 3 characters)",
          "Username can't be blank",
          "Email can't be blank",
          "Email not a UnB email",
          "Password confirmation must be between 6 and 12 characters"
        )
      end
    end
  end

  describe '#update' do
    fixtures 'professor'
    describe 'happy path' do
      before :each do
        @info = {
          name: 'Genaina Nunes',
          username: 'gnunes',
          role: '2'
        }

        @params = Hash.new
        @params[:professor] = @info
        @params[:id] = 0

        @professor = professor(:some_professor)
      end

      it 'calls the method that locates the Professor' do

        expect(Professor).to receive(:find_by_email).and_return(@professor)
        put :update, params: @params
      end

      it 'calls the controller method that filters the form input' do
        allow(Professor).to receive(:find_by_email).and_return(@professor)
        expect_any_instance_of(ProfessorsController).to receive(:professor_params)
          .and_return @params[:professor]
        put :update, params: @params
      end

      it 'calls the model method that performs the update' do
        ActionController::Parameters.permit_all_parameters = true
        @professor_params = ActionController::Parameters.new(@params[:professor])

        allow(Professor).to receive(:find_by_email).and_return @professor
        expect(@professor).to receive(:update_attributes).with(@professor_params)
          .and_return(@professor.update_attributes(@professor_params))
        put :update, params: @params
      end

      it 'redirects the updated user to the dashboard' do
        allow(Professor).to receive(:find_by_email).and_return @professor
        put :update, params: @params

        expect(flash[:notice]).to eq('Cadastro atualizado com sucesso!')
        redirect_to dashboard_path
        expect(subject).to redirect_to ('/dashboard')
      end
    end

    describe 'sad paths' do
      fixtures 'professor'
      before :each do
        @non_unique_info = {
          name: 'Genaina Nunes',
          username: 'rbonifacio',
          role: '4'
        }

        @invalid_info = {
          name: '',
          username: '',
          role: '',
          password: '',
          password_confirmation: ''
        }

        @params = Hash.new
        @params[:id] = 0

        @professor = professor(:some_professor)
      end

      it 'tries to update an user with non-unique information' do
        @params[:professor] = @non_unique_info
        ActionController::Parameters.permit_all_parameters = true
        @professor_params = ActionController::Parameters.new(@params[:professor])

        allow(Professor).to receive(:find_by_email).and_return @professor
        expect(@professor).to receive(:update_attributes).with(@professor_params)
          .and_return(@professor.update_attributes(@professor_params))
        put :update, params: @params
        expect(flash[:danger]).to include('Username has already been taken')
        redirect_to dashboard_path
        expect(subject).to redirect_to ('/dashboard')
      end

      it 'tries to update an user with invalid information' do
        @params[:professor] = @invalid_info
        ActionController::Parameters.permit_all_parameters = true
        @professor_params = ActionController::Parameters.new(@params[:professor])

        allow(Professor).to receive(:find_by_email).and_return @professor
        expect(@professor).to receive(:update_attributes).with(@professor_params)
         .and_return(@professor.update_attributes(@professor_params))
        put :update, params: @params
        expect(flash[:danger]).to include(
          "Name can't be blank",
          "Name is too short (minimum is 3 characters)",
          "Username can't be blank",
          "Username is too short (minimum is 3 characters)",
          "Username only word characters (letter, numbers, underscore...)"
        )
      end
    end
  end
end