class DashboardController < ApplicationController
  before_action :user_logged

  def index; end

  def edit_user
    if current_user.kind_of?(User)
      @user = User.find_by_email(session[:user_id])
    elsif current_user.kind_of?(Professor)
      @professor = Professor.find_by_email(session[:user_id])
    end
  end

  private
  def user_logged
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar essa página"
    end
  end
end
