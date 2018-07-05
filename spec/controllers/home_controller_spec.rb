# frozen string literal: true

require 'rails_helper'

describe HomeController do
  describe '#index' do
    it 'should render the views/home/index.html.haml' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end