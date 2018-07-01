# frozen string literal: true

require 'rails_helper'

describe FaqController do
  describe "#index" do
    it 'should render the views/faq/index.html.haml' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end