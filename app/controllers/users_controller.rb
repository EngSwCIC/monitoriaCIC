class UsersController < ApplicationController
  ## GET /users/new
  def new ; end

  ## POST /users/sign_up
  def create
    @user = User.create(user_params)
    #puts '*********'
    #puts user_params
    #puts user_params.class

    if !@user.errors.any?
      log_in(@user)
      flash[:notice] = "Registro realizado com sucesso!"
      redirect_to dashboard_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def update
    @user = User.find_by_email(session[:user_id])
    permitted = user_params
    @user.update_attributes(permitted)

    if !@user.errors.any?
      flash[:notice] = "Cadastro atualizado com sucesso!"
    elsif
      flash[:danger] = @user.errors.full_messages
      puts flash[:danger]
    end

    redirect_to dashboard_path
  end

  private
  def user_params
   params.require(:user).permit(:id, :name, :matricula, :email, :cpf, :rg, :password, :password_confirmation)
  end
end
