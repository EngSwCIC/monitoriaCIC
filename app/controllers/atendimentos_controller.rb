class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: [:edit, :update, :destroy]

  # GET /atendimentos/new
  ##
  # busca o usuário logado para associá-lo ao novo atendimento.
  def new
    @atendimento = Atendimento.new
    @user = current_user
  end

  # GET /atendimentos/1/edit
  def edit
    @user = current_user    
  end

  # POST /atendimentos
  # POST /atendimentos.json
  # Método para criar um atendimento, associando o atendimento ao usuário logado,
  # que será passado pelo atendimento_params
  # Retorna para a pagina dashboard/atendimentos
  def create
    @user = current_user
    @atendimento = Atendimento.create(atendimento_params)

    if !@atendimento.errors.any?
      flash[:notice] = "Registro de atendimento realizado com sucesso!"
    else
      flash[:danger] = @atendimento.errors.full_messages
    end

    redirect_to dashboard_atendimentos_path
  end

  # PATCH/PUT /atendimentos/1
  # PATCH/PUT /atendimentos/1.json
  def update
    @atendimento = Atendimento.find(params[:id])
    @atendimento.update_attributes(atendimento_params)

    if !@atendimento.errors.any?
      flash[:notice] = 'Atendimento atualizado com sucesso!'
    elsif
      flash[:danger] = @atendimento.errors.first[1]
    end

    redirect_to dashboard_atendimentos_path
  end

  # DELETE /atendimentos/1
  # DELETE /atendimentos/1.json
  def destroy
    @atendimento = Atendimento.find(params[:id])
    @atendimento.delete

    flash[:notice] = 'Atendimento apagado com sucesso!'
    redirect_to dashboard_atendimentos_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendimento
      @atendimento = Atendimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atendimento_params
      params.require(:atendimento).permit(:motivo_id, :dia, :descricao, :aluno_atendido, :monitor_id)
    end
end
