class SessionsController < ApplicationController
  def new
  end

  def create
    @data = user_params
  	@user = User.find_by_email(@data[:email])
  	if @user && @user.authenticate(@data[:password])
  		log_in(@user)
  		redirect_to dashboard_path
  	else
  		redirect_to new_session_path, danger: "Email ou senha inválidos"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def user_params
    @data = params.require(:user).permit(:email, :password)
  end
end
