# frozen_string_literal: true

require 'rails_helper'

describe ResetSenhasController do
  describe '#new' do
    it 'should render views/reset_senhas/new.html.haml' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    fixtures 'user'

    before :each do
      @email = {email: 'bernardoc1104@gmail.com'}
      @params = Hash.new
      @params[:reset_senha] = @email
    end

    it 'should receive a valid e-mail and redirect to the homepage' do
      post :create, params: @params
      expect(flash[:notice]).to eq("As instruções para resetar sua senha foram enviadas para seu e-mail.")
      redirect_to root_path
      expect(subject).to redirect_to('/')
    end
  end

  describe '#create sad paths' do
    describe 'email is not on DB' do
      before :each do
        @email = {email: 'abobrinhajr@unb.br'}
        @params = Hash.new
        @params[:reset_senha] = @email
      end

      it 'should receive an invalid e-mail and display the appropriate message' do
        post :create, params: @params
        expect(flash[:danger]).to eq("Seu e-mail não foi encontrado.")
        redirect_to new_reset_senha_path
        expect(subject).to render_template(:new)
      end
    end

    describe 'email field is left blank' do
      before :each do
        @blank = {email: ''}
        @params = Hash.new
        @params[:reset_senha] = @blank
      end

      it 'should receive blank e-mail and display the appropriate message' do
        post :create, params: @params
        expect(flash[:danger]).to eq("Seu e-mail não foi encontrado.")
        redirect_to new_reset_senha_path
        expect(subject).to render_template(:new)
      end
    end

  end

  # Setup needed before methods 'edit' and update
  before :each do
    allow_any_instance_of(ResetSenhasController).to receive(:get_user).and_return(true)
    allow_any_instance_of(ResetSenhasController).to receive(:valid_user).and_return(true)
    allow_any_instance_of(ResetSenhasController).to receive(:check_expiration).and_return(true)
  end

  describe '#edit' do
    fixtures 'user'

    before :each do
      @params = {email: 'bernardoc1104@gmail.com'}
    end

    it 'should render views/reset_senhas/edit.html.haml' do
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do

  end

end
