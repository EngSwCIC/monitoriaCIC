class ResetSenhasController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:reset_senha][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "As instruções para resetar sua senha foram enviadas para seu e-mail."
      redirect_to root_url
    else
      flash.now[:danger] = "Seu e-mail não foi encontrado."
      render 'new'
    end
  end

  def edit
  end
end
