class DadosBancariosController < ApplicationController
  before_action :user_logged

  def new; end

  def create
    @dados_bancarios = DadosBancarios.create(dados_bancarios_params)

    if !@dados_bancarios.errors.any?
      @user = current_user
      @fk_banco = DadosBancarios.find_by(
        codigo: @dados_bancarios.codigo,
        agencia: @dados_bancarios.agencia,
        conta_corrente: @dados_bancarios.conta_corrente
      )
      @user.update(fk_banco: @fk_banco.id)

      flash[:notice] = 'Dados bancários cadastrados com sucesso!'
    else
      flash[:danger] = @dados_bancarios.errors.full_messages
    end

    redirect_to dashboard_dados_bancarios_path
  end

  def edit
    @user = current_user
    @dados_bancarios = DadosBancarios.find(@user.fk_banco)
  end

  def update
    @dados_bancarios = DadosBancarios.find(params[:id])
    @dados_bancarios.update_attributes(dados_bancarios_params)

    if !@dados_bancarios.errors.any?
      flash[:notice] = 'Dados atualizados com sucesso!'
    elsif
      flash[:danger] = @dados_bancarios.errors.full_messages
    end

    redirect_to dashboard_dados_bancarios_path
  end

  def destroy
    @user = current_user
    @dados_bancarios = DadosBancarios.find(params[:id])
    @dados_bancarios.delete
    @user.update(fk_banco: nil)

    redirect_to dashboard_dados_bancarios_path
  end

  private
  def user_logged
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar essa página"
    end
  end

  def dados_bancarios_params
    params.require(:dados_bancarios).permit(:codigo, :agencia, :conta_corrente)
  end
end