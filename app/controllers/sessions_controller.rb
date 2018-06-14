class SessionsController < ApplicationController
  def new ; end

  def create
    ## Busca aluno e professor. Retorna apenas um que for encontrado.
    @login ||= User.find_by_email(login_params[:email]) 
  	if @login && @login.authenticate(login_params[:password])
      log_in(@login)
  		redirect_to dashboard_path
  	else
      redirect_to new_session_path, danger: "Email ou senha inválidos"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  ## Define os parâmetros que serão lidos no formulário de login
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
