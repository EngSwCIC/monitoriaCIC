class MonitoriasController < ApplicationController
	before_action :find_monitoria, only: [:show, :edit, :update, :destroy]
	before_action :logged_in

	def new
		@monitoria = Monitoria.new
		@user = current_user
	end

	def create
		@monitoria = Monitoria.new monitoria_params

		if @monitoria.save
			redirect_to dashboard_monitorias_path, notice: "Aplicaçao para monitoria enviada com sucesso!"
		else
			flash[:danger] = "Ocorreu um erro ao cadastrar a monitoria. Nenhuma monitoria cadastrada."
			render 'new'
		end		
	end

	def show
		@alunos = User.find_each
	end

	def edit	
	end

	def update
		if @monitoria.update monitoria_params
			redirect_to dashboard_monitorias_path, notice: "Situaçao atualizada!"
		else
			render 'edit'
		end
	end

	def destroy
		@monitoria.destroy
		redirect_to dashboard_monitorias_path, notice: "Monitoria removida!"
	end

	private
	def monitoria_params
		params.require(:monitoria).permit(:remuneracao, :fk_matricula, :fk_cod_disciplina, :fk_turmas_id, :descricao_status, :prioridade, :fk_status_monitoria_id)
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
