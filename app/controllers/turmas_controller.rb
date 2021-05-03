class TurmasController < ApplicationController
  # GET #new
  def new
    @user = current_user
  end

  def edit
    @turma = Turma.find(params[:id])
  end

  def create
    @turma = Turma.create(turma_params)

    if !@turma.errors.any?
      flash[:notice] = 'Turma cadastrada com sucesso!'
    else
      flash[:danger] = @turma.errors.full_messages
    end

    redirect_to dashboard_turmas_path
  end

  def update
    @turma = Turma.find(params[:id])
    @turma.update_attributes(turma_params)

    if !@turma.errors.any?
      flash[:notice] = 'Turma atualizada com sucesso!'
    else
      flash[:danger] = @turma.errors.full_messages
    end

    redirect_to dashboard_turmas_path
  end

  def destroy
    @turma = Turma.find(params[:id])
    Monitoria.find_each do |m|
      if m.fk_turmas_id == @turma.id
        m.destroy
      end
    end
    @turma.destroy
    flash[:notice] = 'Turma apagada com sucesso!'
    redirect_to dashboard_turmas_path
  end

  private
  def turma_params
    params.require(:turma).permit(:id, :turma, :professor, :professor_auxiliar, :fk_cod_disciplina, :qnt_bolsas, :fk_vagas_id)
  end

  def find_turma
    @turma = Turma.find(params[:id])
  end

  def self.get_turmas(professor)
    @turmas = Array.new
    @turmas_buscadas = Turma.find_each do |turma|
      if turma.professor == professor.name
        @turmas << turma
      end
    end
    @turmas
  end
end
