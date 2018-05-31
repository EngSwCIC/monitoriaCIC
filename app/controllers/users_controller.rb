class UsersController < ApplicationController
  ## GET /users/new
  def new ; end

  ## POST /users/sign_up
  def create
    @user = User.create(user_params)

    if !@user.errors.any?
      flash[:notice] = "Registro realizado com sucesso!"
      redirect_to new_user_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private
  def user_params
    @data = params.require(:user).permit(:id, :name, :matricula, :email, :cpf, :rg, :password, :password_confirmation)
    @data[:id] = @data[:id].to_i
    @data[:id] += (User.count() + 1)

    return @data
  end
end
