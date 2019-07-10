class ResetSenhasController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:reset_senha][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:notice] = "As instruções para resetar sua senha foram enviadas para seu e-mail."
      redirect_to root_url
    else
      flash.now[:danger] = "Seu e-mail não foi encontrado."
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "O campo senha deve ser preenchido.")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Sua nova senha foi salva."
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  private

    # Instancia o usuário em questão procurando por seu e-mail
    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirma se o usuário instanciado acima é válido verificando o token que foi passado
    def valid_user
      unless @user && @user.authenticated?(:reset, params[:id])
      redirect_to root_url
      end
    end

    # Verifica se o token em questão expirou
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_reset_senha_url
      end
    end

    # Filtra os parâmetros que serão passados para o BD
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
