class MotivosController < ApplicationController
  before_action :set_motivo, only: [:show, :edit, :update, :destroy]

  # GET /motivos
  # GET /motivos.json
  def index
    @motivos = Motivo.all
  end

  # GET /motivos/1
  # GET /motivos/1.json
  def show
  end

  # GET /motivos/new
  def new
    @motivo = Motivo.new
  end

  # GET /motivos/1/edit
  def edit
  end

  # POST /motivos
  # POST /motivos.json
  def create
    @motivo = Motivo.new(motivo_params)

    respond_to do |format|
      if @motivo.save
        format.html { redirect_to @motivo, notice: 'Motivo was successfully created.' }
        format.json { render :show, status: :created, location: @motivo }
      else
        format.html { render :new }
        format.json { render json: @motivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motivos/1
  # PATCH/PUT /motivos/1.json
  def update
    respond_to do |format|
      if @motivo.update(motivo_params)
        format.html { redirect_to @motivo, notice: 'Motivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @motivo }
      else
        format.html { render :edit }
        format.json { render json: @motivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivos/1
  # DELETE /motivos/1.json
  def destroy
    @motivo.destroy
    respond_to do |format|
      format.html { redirect_to motivos_url, notice: 'Motivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motivo
      @motivo = Motivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motivo_params
      params.require(:motivo).permit(:nome)
    end
end
