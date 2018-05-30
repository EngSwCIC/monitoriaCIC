class UsersController < ApplicationController
  ## GET /users/new
  def new ; end

  ## POST /users/sign_up
  def create
    @matricula  = false
    @email      = false
    @cpf        = false
    @rg         = false
    @password   = false

    @user = User.create!(user_params)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :matricula, :email, :cpf, :rg, :password, :password_confirmation)
  end
end
