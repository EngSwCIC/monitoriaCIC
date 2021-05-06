class AdminsController < ApplicationController
  def index ; end

  
  def new ; end

  def create
    @admin = Admin.create(admin_params)
    redirect_to root_path
  end

  def admin_params
    params.require(:admin).permit(:id, :name, :email, :password, :password_confirmation)
  end
end