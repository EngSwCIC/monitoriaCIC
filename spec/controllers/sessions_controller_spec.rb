require 'rails_helper'

describe SessionsController do
	describe 'create' do
		before :each do
		    @info = {
		        email: 'jm.duda@uol.com.br',
		        password: 'joao123',
		    }
		    @params = Hash.new
		    @params[:user] = @info
		  end
		it 'calls the model method to find user' do
	        expect(User).to receive(:find_by_email)
	        post :create, params: @params
		end
		it 'logs user in' do
			expect(assigns(:user)).to eq(@user)
		    sessions_helper = double('sessions_helper')
		    allow(sessions_helper).to receive(:log_in).with(:user)
		    post :create, params: @params
		end
		it 'redirects to dashboard' do 
			post :create, params: @params
	      	redirect_to dashboard_path
	      	expect(subject).to redirect_to('/dashboard/index')
	      	# Algo errado nao consigo achar oq. Login funcionando corretamente antes
	    end
	end
end


