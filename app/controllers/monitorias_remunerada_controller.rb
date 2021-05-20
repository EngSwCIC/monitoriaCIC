class MonitoriasRemuneradaController < ApplicationController
	before_action :find_monitor, only: [:show]
	before_action :find_monitoria, only: [:destroy, :edit, :update]

	def show
		@alunos = User.find_each
	end

	##
	# Método para dar update nas vagas de monitoria, ao atualizar a situação
	# da monitoria, atualiza a quantidade de bolsas de cada turma.
	# Por fim redireciona a página para a aba de monitoria remunerada.

	def update
		@turmas = Turma.all
		status = @monitoria.fk_status_monitoria_id
		turma_id = @monitoria.fk_turmas_id

		case status
		when 1 || 2 
			situacao = 1
		else
			situacao = 2
		end

		@turmas.each do |turma|
			if turma.id == turma_id
				bolsas = turma.qnt_bolsas
				case situacao
				when 1
					turma.update!(qnt_bolsas: bolsas + 1)
				else
					if(bolsas > 0)
						turma.update!(qnt_bolsas: bolsas - 1)
					end
				end
			end
		end

		if @monitoria.update monitoria_params
			redirect_to dashboard_monitoria_remunerada_path, notice: "Situaçao atualizada!"
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
end
