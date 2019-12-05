class AtividadesController < ApplicationController
  before_action :user_logged
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]

  # GET /atividades
  # GET /atividades.json
  def index
    @atividades = Atividade.all
  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades
  # POST /atividades.json
  def create
    @atividade = Atividade.create(atividade_params)

    if !@atividade.errors.any?
      flash[:notice] = "Registro de atividade realizado com sucesso!"
      redirect_to dashboard_atividades_path
    else
      flash[:danger] = @atividade.errors.first[1]
      redirect_to dashboard_atividades_path
    end
  end

  # PATCH/PUT /atividades/1
  # PATCH/PUT /atividades/1.json
  def update

    @atividade = Atividade.find(params[:id])
    @atividade.update_attributes(atividade_params)

    if !@atividade.errors.any?
      flash[:notice] = 'Atividade atualizada com sucesso!'
    elsif
      flash[:danger] = @atividade.errors.first[1]
    end

    redirect_to dashboard_atividades_path
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade = Atividade.find(params[:id])
    @atividade.delete

    flash[:notice] = 'Atividade apagada com sucesso!'
    redirect_to dashboard_atividades_path
  end

  private
  def user_logged
    if !logged_in?
      redirect_to new_session_path, notice: "Você precisa estar logado para acessar essa página"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atividade_params
      params.require(:atividade).permit(:titulo, :mensagem, :matricula_monitor, :data)
    end
end
