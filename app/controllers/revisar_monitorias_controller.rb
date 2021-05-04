class RevisarMonitoriasController < ApplicationController
	before_action :find_monitor, only: [:show]
	before_action :find_monitoria, only: [:destroy, :edit, :update]
	before_action :logged_in

	# def new
	# 	@cod_disciplina = params[:turma]
	# 	@user = current_user
	# end

	# def create
	# 	@monitoria = Monitoria.new(monitoria_params)
	# 	valid = true
	# 	Monitoria.find_each do |m|
	# 		if m.fk_matricula==@monitoria.fk_matricula and m.fk_turmas_id==@monitoria.fk_turmas_id and m.fk_cod_disciplina==@monitoria.fk_cod_disciplina
	# 			valid = false
	# 		end
	# 	end
	#
	# 	if valid and @monitoria.save
	# 		redirect_to dashboard_monitorias_path, notice: "Aplicaçao para monitoria enviada com sucesso!"
	# 	else
	# 		flash[:danger] = "Ocorreu um erro ao cadastrar a monitoria. Nenhuma monitoria cadastrada."
	# 		redirect_to dashboard_monitorias_path
	# 	end
	# end

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
		# @monitoria.fk_status_monitoria_id = params[:put][@monitoria.id]
		monitoria_id = params[:put].keys[0]
	  @monitoria.update(fk_status_monitoria_id: params[:put][monitoria_id])
			redirect_to dashboard_monitorias_revisar_path, notice: "Situaçao atualizada!"

	end
	# def update
	# 	if @monitoria.update monitoria_params
	# 		redirect_to dashboard_monitorias_path, notice: "Situaçao atualizada!"
	# 	else
	# 		render 'edit'
	# 	end
	# end

	def destroy
		@monitoria.destroy
		redirect_to dashboard_monitorias_path, notice: "Monitoria removida!"
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
