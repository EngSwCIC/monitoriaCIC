##
# Implementação da controller de Monitorias
# Função: definir métodos estruturais para listagem, criação, inserção de dados,
# edição de um registro e remoção de um registro

class MonitoriasController < ApplicationController
	before_action :find_monitor, only: [:show]
	before_action :find_monitoria, only: [:destroy, :edit, :update]
	before_action :logged_in

	def new
		@cod_disciplina = params[:turma]
		@user = current_user
	end

	def create
		@monitoria = Monitoria.new(monitoria_params)
		valid = true
		Monitoria.find_each do |m|
			if m.fk_matricula==@monitoria.fk_matricula and m.fk_turmas_id==@monitoria.fk_turmas_id and m.fk_cod_disciplina==@monitoria.fk_cod_disciplina
				valid = false
			end
		end

		if valid and @monitoria.save
			redirect_to dashboard_monitorias_path, notice: "Aplicaçao para monitoria enviada com sucesso!"
		else
			flash[:danger] = "Ocorreu um erro ao cadastrar a monitoria. Nenhuma monitoria cadastrada."
			redirect_to dashboard_monitorias_path
		end		
	end

	def show
		@alunos = User.find_each
	end

	def edit	
	end

	##
  # Método responsável por atualizar um registro com os dados inseridos em Edit.
	#
  # Verifica se o periodo de inscrição está fechado, 
	# caso esteja aberto: Renderiza a de monitorias com uma mensagem de erro.
	#
	# Caso o período esteja fechado: Recebe os dados da view Edit e faz o tratamento dos dados modificados pelo usuário.
	#
  # Caso os dados sejam válidos, o registro é atualizado no banco e renderezado a página de monitorias com uma mensagem de sucesso.
	#
  # Caso os dados sejam inválidos é renderizada a mesma página de edit novamente.
	#
	# PATCH/PUT /monitorias/:id
	def update
		# Se o periodo de inscrição está fechado
		if @monitoria.open == false
			# Se os dados passados atendem os requisitos estipulados na Model
			if @monitoria.update monitoria_params
				# É renderizado para Index da monitoria com uma mensagem de sucesso
				redirect_to dashboard_monitorias_path, notice: "Situaçao atualizada!"
			else
				# Caso os requisitos não forem atendidos, é renderizada a mesma página
				render 'edit'
			end
		else
			# Se o período de inscrição ainda está aberto, é renderizado para Index da monitoria com uma mensagem de erro
			redirect_to dashboard_monitorias_path, notice: "Período de inscrição ainda aberto!"
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

	def find_monitor
		@monitoria = Monitoria.where(fk_turmas_id: params[:id])
	end

	def find_monitoria
		@monitoria = Monitoria.find(params[:id])
	end

	##
  # Método responsável verificar se o usuário está logado
	# Se o usuário não está logado retorna uma mensagem de erro e não deixa acessar nenhum método da controller
  end
	def logged_in
		if !logged_in?
			redirect_to new_session_path, notice: "Você precisa estar logado para acessar a pagina Monitoria"
		end
	end
end
