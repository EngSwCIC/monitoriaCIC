# frozen_string_literal: true

require 'rails_helper'

describe UsersController do
  describe '#new' do
    it 'should render the views/users/new.html.haml view' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    before :each do
      # code here ...
    end

    it 'calls the controller method that filters the form input'

    it 'calls the model method that creates the user' do
      expect(User).to receive(:create).with(@user)
      post :create, params: @user
    end

    it 'calls the sessions helper method that logs the registered user'

    it 'redirects the registered user to the dashboard'
  end

  describe '#user_params' do
    it 'filters the data that was POSTed via the views form'
  end
end