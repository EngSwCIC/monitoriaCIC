class SessionsController < ApplicationController
  def new
  end

  def create
    # @data = user_params
    
  	@user = User.find_by_email(user_params[:email])
  	if @user && @user.authenticate(user_params[:password])
  		log_in(@user)
  		redirect_to dashboard_path
  	else
      @professor = Professor.find_by_email(professor_params[:email])
      if @professor && @professor.authenticate(professor_params[:password])
        log_in(@professor)
        redirect_to root_url, notice: "Logged in"
      else
  		  redirect_to new_session_path, danger: "Email ou senha inválidos"
  	  end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


# Mesma funcao?? 

  def user_params
    @data = params.require(:user).permit(:email, :password)
  end

  def professor_params
    @data = params.require(:user).permit(:email, :password)
  end
end
