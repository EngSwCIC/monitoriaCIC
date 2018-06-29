class DisciplinasController < ApplicationController
	before_action :find_disciplina, only: [:show, :edit, :update, :destroy] 

	def index
		@disciplinas = Disciplina.find_each
	end

	def new
		@disciplina = Disciplina.new
	end

	def create
		@disciplina = Disciplina.new disciplina_params

		if @disciplina.save
			redirect_to @disciplina, notice: "Disciplina cadastrada com sucesso!"
		else
			render 'new', danger: "Ocorreu um erro ao cadastrar a disciplina. Nenhuma disciplina cadastrada."
		end		
	end

	def show
	end

	def edit		
	end

	def update
		if @disciplina.update disciplina_params
			redirect_to disciplinas_path, notice: "Disciplina atualizada!"
		else
			render 'edit'
		end
	end

	def destroy
		@disciplina.destroy
		redirect_to disciplinas_path, notice: "Disciplina removida!"
	end

	private

	def disciplina_params
		params.require(:disciplina).permit(:nome, :fk_tipo_disciplina_id, :c_prat, :c_teor, :c_est, :c_ext)
	end

	def find_disciplina
		@disciplina = Disciplina.find(params[:id])
	end
end
