# frozen string literal: true

require 'rails_helper'

describe SobreController do
  it 'should render the views/sobre/index.html.haml' do
    get :index
    expect(response).to render_template(:index)
  end
end