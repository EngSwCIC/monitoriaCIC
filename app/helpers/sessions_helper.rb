module SessionsHelper
  def log_in(user)
    session[:user_id] = user.email
  end

  def logged_user
  	if !current_user.nil?
  		current_user
  	end
  end

  def current_user
    ## Determina se o usuário logado é um aluno ou professor
    @current_user ||= User.find_by(email: session[:user_id]) || Professor.find_by(email: session[:user_id]) || Admin.find_by(email: session[:user_id])
  end

  def logged_in?
    !logged_user.nil?
  end

  def is_admin
		if !current_user.kind_of?(Admin)
			flash[:danger] = "Acesso negado."
				redirect_to dashboard_path
		end
	end
end
