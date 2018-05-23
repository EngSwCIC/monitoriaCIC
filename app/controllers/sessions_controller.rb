class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.email
  		redirect_to root_url, notice: "Logged In"
  	else
  		redirect_to new_session_path, notice: "Credenciais invalidas"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out"
  end
end
