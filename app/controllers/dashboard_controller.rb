class DashboardController < ApplicationController
  def index
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar o Dashboard"
    end
  end
end
