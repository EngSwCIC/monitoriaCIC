class UsersController < ApplicationController
  ## GET /users/new
  def new ; end

  ## POST /users/sign_up
  def create
    @user = User.create(user_params).valid?

    if @user
      flash[:notice] = "Registro realizado com sucesso!"
      redirect_to root_path
    else
      flash[:danger] = "Registro não pôde ser realizado."
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :matricula, :email, :cpf, :rg, :password, :password_confirmation)
  end
end
