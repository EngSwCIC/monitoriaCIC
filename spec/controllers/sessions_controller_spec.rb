require 'rails_helper'

describe SessionsController do
	describe 'create' do
		before :each do
      @user = FactoryBot.build(:user)

			@info = { email: @user.email, password: @user.password }
			@params = Hash.new
			@params[:user] = @info
      @session = {}
      @session[:user_id] = @user.email
		end
		it 'calls the model method to find user' do
			expect(User).to receive(:find_by_email).and_return(@user)
			post :create, params: @params
		end
		it 'logs user in' do
      # expect(@user).to receive(:authenticate).with(@params[:user][:password])
      expect_any_instance_of(SessionsController).to receive(:log_in).with(@user)
      	.and_return(@session)
			post :create, params: @params
		end
		it 'redirects to dashboard' do 
			post :create, params: @params
			redirect_to dashboard_path
			expect(subject).to redirect_to('/dashboard')
		end
	end
end