class RevisarMonitoriasController < ApplicationController
	before_action :find_monitor, only: [:show]
	before_action :find_monitoria, only: [:destroy, :edit, :update]
	before_action :logged_in

	def show
		@alunos = User.find_each

		@turmas = Turma.all
		@remuneracao = 'Todas'
		get_params = params[:get]
		if get_params && get_params.has_key?(:remuneracao)
			@remuneracao = params[:get][:remuneracao]
		end
		if @remuneracao != 'Todas'
			@monitorias = Monitoria.find_by_remuneracao @remuneracao
		else
			@monitorias = Monitoria.all
		end
	end

	def edit
		monitoria_id = params[:put].keys[0]
	  @monitoria.update(fk_status_monitoria_id: params[:put][monitoria_id])
		redirect_to dashboard_monitorias_revisar_path, notice: "Situaçao atualizada!"
	end

	private
	def monitoria_params
		params.require(:monitoria).permit(:remuneracao, :fk_matricula, :fk_cod_disciplina, :fk_turmas_id, :descricao_status, :prioridade, :fk_status_monitoria_id)
	end

	def find_monitor
		@monitoria = Monitoria.where(fk_turmas_id: params[:id])
	end

	def find_monitoria
		@monitoria = Monitoria.find(params[:put].keys[0])
	end

	def logged_in
		if !logged_in?
			redirect_to new_session_path, notice: "Você precisa estar logado para acessar a pagina Monitoria"
		end
	end
end
