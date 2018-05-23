class UsersController < ApplicationController
  ## GET /users/new
  def new
    redirect_to root_path
  end

  ## POST /users/sign_up
  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to root_path, notice: "Registro realizado com sucesso!"
    else
      redirect_to root_path, notice: "Registro não pôde ser realizado."
    end
  end

  private
  def user_params
    user= params.require(:user).permit(:name, :matricula, :email, :cpf, :rg, :password)
    return user
  end
end
