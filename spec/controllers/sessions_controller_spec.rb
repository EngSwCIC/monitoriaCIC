require 'rails_helper'

describe SessionsController do
	describe 'create' do
		it 'assigns an user from the model'
		it 'logs user in'
		it 'redirects to dashboard' do 
			fake_results = double('user')
			allow(User).to receive(:find_by_email).and_return(fake_results)
			post :create, {:params => :email}
			expect(:response).to redirect_to(dashboard_path)
		end
	end
end
