class DisciplinasController < ApplicationController
	before_action :find_disciplina, only: [:show, :edit, :update, :destroy]
	before_action :is_admin, only: [:edit, :new, :create, :update, :destroy] 
	before_action :logged_in

	def index
		@disciplinas = Disciplina.find_each
	end

	def new
		@disciplina = Disciplina.new
	end

	def create
		@disciplina = Disciplina.new disciplina_params

		if @disciplina.save
			redirect_to disciplinas_path, notice: "Disciplina cadastrada com sucesso!"
		else
			flash[:danger] = "Ocorreu um erro ao cadastrar a disciplina. Nenhuma disciplina cadastrada."
			render 'new'
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

	def logged_in
		if !logged_in?
	      redirect_to new_session_path, notice: "Você precisa estar logado para acessar as Disciplinas"
	    end
	end

	def is_admin
		if !current_user.kind_of?(Admin)
		  flash[:danger] = "Acesso negado."
	      redirect_to disciplinas_path
	    end
	end
end
