class DashboardController < ApplicationController
  before_action :user_logged

  def index; end

  def edit_user; end

  private
  def user_logged
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar essa página"
    end
  end
end
