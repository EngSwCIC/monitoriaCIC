class DisciplinasController < ApplicationController
	before_action :find_disciplina, only: [:show, :edit, :update, :destroy]
	before_action :is_admin, only: [:edit, :new, :create, :update, :destroy] 
	before_action :logged_in


	##
	# Método que instancia um novo objeto de disciplina
	#
	# Método sem parametros
	#  
	# Retorna uma nova instancia de disciplina
	def new
		@disciplina = Disciplina.new
	end


	##
	# Método que salva uma nova disciplina no banco de dados
	#
	# Método sem parametros
	#
	# Retorna para a view de dashboard, caso consiga salvar a disciplina. Caso contrário, retorna uma mensagem de erro. 
	def create
		@disciplina = Disciplina.new disciplina_params

		if @disciplina.save
			redirect_to dashboard_disciplinas_path, notice: "Disciplina cadastrada com sucesso!"
		else
			flash[:danger] = "Ocorreu um erro ao cadastrar a disciplina. Nenhuma disciplina cadastrada."
			render 'new'
		end		
	end

	##
	# Método que edita uma disciplina.
	#
	def edit
	
	end


	##
	# Método para atualizar uma disciplina.
	# 
	# Método recebe as informações que devem ser alteradas/mantidas na disciplina.
	# 
	# Retorna para a view de dashboard de disciplinas se a atualização foi bem sucedida (parâmetros válidos). Caso contrário mostra uma mensagem de erro e renderiza a view de edição de disciplinas.
	def update
		if @disciplina.update disciplina_params
			redirect_to dashboard_disciplinas_path, notice: "Disciplina atualizada!"
		else
			flash[:danger] = "Ocorreu um erro ao atualizar a disciplina."
			render 'edit'
		end
	end

	##
	# Método que exclui uma disciplina do banco de dados.
	#
	# O Método procura e apaga a disciplina das turmas e monitorias das quais ela pertence, e depois apaga a disciplina. Funciona como um Cascade.
	#
	# Parâmetro: Código da disciplina .
	#
	# Redireciona para a view do dashboard de disciplinas após apagar tudo, caso a remoção foi bem sucedida, com uma mensagem de disciplina removida.
	def destroy
		Turma.find_each do |t|
			if t.fk_cod_disciplina == @disciplina.cod_disciplina
				t.destroy
			end 
		end
		Monitoria.find_each do |m|
			if m.fk_cod_disciplina == @disciplina.cod_disciplina
				m.destroy
			end
		end
		@disciplina.destroy
		redirect_to dashboard_disciplinas_path, notice: "Disciplina removida!"
	end

	private
	##
	# Método que especifica e filtra os parâmetros da disciplina.
	#
	# O método recebe parâmetros arbitrários e filtra todos os não permitidos
	#
	# Retorna quais são os parâmetros permitidos para uma disciplina.
	def disciplina_params
		params.require(:disciplina).permit(:nome, :fk_tipo_disciplina_id, :c_prat, :c_teor, :c_est, :c_ext, :monitoria)
	end

	##
	# Método que localiza uma disciplina.
	#
	# Método com parâmetros: id.
	#
	# Retorna a disciplina com o id especificado.
	def find_disciplina
		@disciplina = Disciplina.find(params[:id])
	end

	##
	# Método que verifica se o usuário está logado.
	#
	# Método sem parâmetro.
	#
	# Redireciona para a view de login com a mensagem de aviso.
	def logged_in
		if !logged_in?
			redirect_to new_session_path, notice: "Você precisa estar logado para acessar as Disciplinas"
		end
	end

	##
	# Método que localiza uma disciplina.
	#
	# Parâmetro: id.
	#
	# Retorna a disciplina com o id especificado.
	def is_admin
		if !current_user.kind_of?(Admin)
			flash[:danger] = "Acesso negado."
				redirect_to dashboard_disciplinas_path
		end
	end
end