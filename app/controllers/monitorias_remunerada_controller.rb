class MonitoriasRemuneradaController < ApplicationController
	before_action :find_monitor, only: [:show]
	before_action :find_monitoria, only: [:destroy, :edit, :update]
	before_action :logged_in

	def show
		@alunos = User.find_each
	end

	def edit	
	end

	def update
    @turmas = Turma.all
    situacao = 0
    
    if @monitoria.fk_status_monitoria_id == 1 || @monitoria.fk_status_monitoria_id == 3
      situacao = 1
    elsif @monitoria.fk_status_monitoria_id == 2
      situacao = 2
    end

    @turmas.each do |turma|
      if turma.id == @monitoria.fk_turmas_id
        if situacao == 1
          turma.update!(qnt_bolsas: turma.qnt_bolsas + 1)
        elsif situacao == 2
          turma.update!(qnt_bolsas: turma.qnt_bolsas - 1)
        end
      end
    end

		if @monitoria.update monitoria_params
			redirect_to dashboard_monitoria_remunerada_path, notice: "Situaçao atualizada!"
		else
			render 'edit'
		end
	end

	private
	def monitoria_params
		params.require(:monitoria).permit(:remuneracao, :fk_matricula, :fk_cod_disciplina, :fk_turmas_id, :descricao_status, :prioridade, :fk_status_monitoria_id)
	end

	def find_monitor
		@monitoria = Monitoria.where(fk_turmas_id: params[:id])
	end

	def find_monitoria
		@monitoria = Monitoria.find(params[:id])
	end

	def logged_in
		if !logged_in?
			redirect_to new_session_path, notice: "Você precisa estar logado para acessar a pagina Monitoria"
		end
	end
end
