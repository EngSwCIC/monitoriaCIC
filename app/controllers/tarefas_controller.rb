class TarefasController < ApplicationController
  before_action :set_tarefa, only: [:show, :edit, :update, :destroy]

  # GET /tarefas
  # GET /tarefas.json
  def index
    @tarefas = []
    @monitoria_id = params[:monitoria_id].to_i
    @all_tarefas = Tarefa.all
    @all_tarefas.each do |tarefa|
      if tarefa.monitoria_id == @monitoria_id
        @tarefas.push(tarefa)
      end
    end
  end

  # GET /tarefas/1
  # GET /tarefas/1.json
  def show

  end

  # GET /tarefas/new
  def new
    @monitoria_id = params[:monitoria_id]
    @tarefa = Tarefa.new(:monitoria_id => @monitoria_id)
  end

  # GET /tarefas/1/edit
  def edit
  end

  # POST /tarefas
  # POST /tarefas.json
  def create
    @tarefa = Tarefa.new(tarefa_params)
    if @tarefa.save
      redirect_to dashboard_monitorias_path, notice: "Tarefa atribuida com sucesso!"
    else
      flash[:danger] = "Ocorreu um erro ao atribuir a tarefa."
      redirect_to dashboard_monitorias_path
    end

    
  end

  # PATCH/PUT /tarefas/1
  # PATCH/PUT /tarefas/1.json
  def update
    if @tarefa.update(tarefa_params)
      redirect_to dashboard_monitorias_path, notice: "Tarefa atualizada!"
    else
      flash[:danger] = "Ocorreu um erro ao atualizar a tarefa."
      redirect_to dashboard_monitorias_path
    end
  end

  # DELETE /tarefas/1
  # DELETE /tarefas/1.json
  def destroy
    @tarefa.destroy
    redirect_to dashboard_monitorias_path, notice: "Tarefa removida!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarefa_params
      params.require(:tarefa).permit(:titulo, :descricao, :nota, :feito, :inicio, :fim, :monitoria_id)
    end
end
