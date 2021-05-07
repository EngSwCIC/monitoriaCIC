class MonitoriaMailer < ApplicationMailer

  
  def resultado_monitoria_user
    @resultado = params[:resultado]
    @user = User.find_by_matricula(@resultado.fk_matricula)
	@turma = Turma.find(@resultado.fk_turmas_id)
	@disciplina = Disciplina.find(@turma.fk_cod_disciplina)
    mail to: @user.email, subject: "Resultado do processo da monitoria"
  end
  
  def resultado_monitoria_prof
    @resultado = params[:resultado]
    @user = User.find_by_matricula(@resultado.fk_matricula)
	@turma = Turma.find(@resultado.fk_turmas_id)
	@disciplina = Disciplina.find(@turma.fk_cod_disciplina)
	@professor = Professor.find_by_name(@turma.professor)
    mail to: @professor.email, subject: "Resultado do processo da monitoria"
  end
    
end
