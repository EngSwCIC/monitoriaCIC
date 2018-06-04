module SessionsHelper
  def log_in(user)
    session[:user_id] = user.email
  end

  def logged_user
  	if !current_user.nil?
  		current_user
  	else
	  	if !current_professor.nil?
	  		current_professor
  		end
  	end
  end

  def current_user
    @current_user ||= User.find_by(email: session[:user_id])
  end

  def current_professor
    @current_professor ||= Professor.find_by(email: session[:user_id])
  end

  def logged_in?
    !logged_user.nil? 
  end
end
