# frozen string literal: true

require 'rails_helper'

describe AdminsController do
  describe '#new' do
    it 'should render the views/admins/new.html.haml' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    before :each do
      @info = {
        name: 'Admin MonitoriaCiC',
        email: 'secretaria@cic.unb.br',
        password: '110492',
        password_confirmation: '110492'
      }

      @params = Hash.new
      @params[:admin] = @info
    end

    it 'calls the controller method that filters the form input' do
      expect_any_instance_of(AdminsController).to receive(:admin_params)
        .and_return(@params[:admin])
      post :create, params: @params
    end

    it 'calls the model method that creates the Admin' do
      ActionController::Parameters.permit_all_parameters = true
      @admin = ActionController::Parameters.new(@params[:admin])

      expect(Admin).to receive(:create).with(@admin)
                                       .and_return(Admin.create(@admin))
      post :create, params: @params
    end

    it 'should redirect the user to the main page' do
      post :create, params: @params
      redirect_to root_path
      expect(subject).to redirect_to('/')
    end
  end
end