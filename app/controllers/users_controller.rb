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
  rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid => err
    if err.message.include? "users.matricula"
      @matricula = true
    elsif err.message.include? "users.email"
      @email = true
    elsif err.message.include? "users.cpf"
      @cpf = true
    elsif err.message.include? "users.rg"
      @rg = true
    elsif err.message.include? "Validation failed"
      @invalid = true
    end

    if @matricula || @email || @cpf || @rg || @invalid
      flash[:notice] = "Registro não pôde ser realizado."
      redirect_to root_path
    else
      flash[:notice] = "Registro realizado com sucesso!"
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :matricula, :email, :cpf, :rg, :password, :password_confirmation)
  end
end
