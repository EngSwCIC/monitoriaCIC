# frozen_string_literal: true

require 'rails_helper'

describe EmailResultadosController do
  describe '#new' do
  
    it 'should render views/email_resultados/new.html.haml' do
      get :new
      expect(response).to render_template(:new)
    end
    
  end
  
  describe '#create' do
    
    it 'should receive a valid e-mail and return to the dashboard' do
    end
    
    it 'should receive a valid e-mail with the following properties to a registered user' do
    end
    
  end
    
  describe '#edit' do
  
    it 'should render views/email_resultados/edit.html.haml' do
    end
    
  end  
    
  describe '#update' do
  
    it 'should call the controller method that filters the form input' do
    end
    
    it 'should receive a valid monitoria and perform the update' do
    end
    
  end
  
end
