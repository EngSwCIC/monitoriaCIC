class UsersController < ApplicationController
  ## GET /users/new
  def new ; end

  ## POST /users/sign_up
  def create
    User.create(params[:user])

    # if !@user.errors.any?
    #   log_in(@user)
    #   flash[:notice] = "Registro realizado com sucesso!"
    #   redirect_to dashboard_path
    # else
    #   flash[:danger] = @user.errors.full_messages
    #   redirect_to new_user_path
    # end
  end

  # private
  # def user_params
  #  params.require(:user).permit(:id, :name, :matricula, :email, :cpf, :rg, :password, :password_confirmation)
  # end
end
